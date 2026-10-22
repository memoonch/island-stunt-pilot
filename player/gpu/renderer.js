'use strict';
window.stuntGpuReady = (async function () {
  window.stuntPreloader?.phase('Preparing the hangar…',0.08);
  const canvas=document.querySelector('#world');
  const status=document.querySelector('#status');
  const gl=canvas.getContext('webgl',{alpha:false,antialias:true,powerPreference:'high-performance'});
  if(!gl)throw Error('WebGL is unavailable');
  const vert='attribute vec3 aPosition;attribute vec2 aUV;uniform mat4 uMVP;varying vec2 vUV;void main(){gl_Position=uMVP*vec4(aPosition,1.0);vUV=aUV;}';
  const frag='precision mediump float;varying vec2 vUV;uniform sampler2D uTexture;uniform float uAlpha;void main(){vec4 c=texture2D(uTexture,vUV);c.a*=uAlpha;if(c.a<0.015)discard;gl_FragColor=c;}';
  function shader(type,text){const s=gl.createShader(type);gl.shaderSource(s,text);gl.compileShader(s);if(!gl.getShaderParameter(s,gl.COMPILE_STATUS))throw Error(gl.getShaderInfoLog(s));return s;}
  const program=gl.createProgram();gl.attachShader(program,shader(gl.VERTEX_SHADER,vert));gl.attachShader(program,shader(gl.FRAGMENT_SHADER,frag));gl.linkProgram(program);if(!gl.getProgramParameter(program,gl.LINK_STATUS))throw Error(gl.getProgramInfoLog(program));
  gl.useProgram(program);
  const pos=gl.getAttribLocation(program,'aPosition'),uv=gl.getAttribLocation(program,'aUV');
  const mvpLocation=gl.getUniformLocation(program,'uMVP'),alphaLocation=gl.getUniformLocation(program,'uAlpha');
  gl.uniform1i(gl.getUniformLocation(program,'uTexture'),0);
  gl.enableVertexAttribArray(pos);gl.enableVertexAttribArray(uv);gl.enable(gl.DEPTH_TEST);gl.depthFunc(gl.LEQUAL);
  gl.enable(gl.BLEND);gl.blendFunc(gl.SRC_ALPHA,gl.ONE_MINUS_SRC_ALPHA);
  const manifest=await fetch('/player/gpu/meshes.json').then(r=>r.json());
  // Explicit comparison URLs do not change the saved texture selection.
  const planeLook=new URLSearchParams(location.search).get('plane');
  if(planeLook==='original'||planeLook==='enhanced'){
    const planeTexture=planeLook==='original'?'assets/174.jpg':'assets/plane-rich-v1.png';
    for(const name of ['plane','hangar_plane'])manifest[name].texture=planeTexture;
  }
  const ringLook=new URLSearchParams(location.search).get('checkpoints');
  if(ringLook==='original'||ringLook==='enhanced')manifest.ring.texture=ringLook==='original'?'assets/172_procedural.ring_colormap.jpg':'assets/checkpoint-gold-v1.png';
  const textures=new Map();
  async function texture(url){
    if(textures.has(url))return textures.get(url);
    const promise=(async()=>{const blob=await fetch('/player/gpu/'+url).then(r=>{if(!r.ok)throw Error('Texture load failed: '+url);return r.blob();});const img=await createImageBitmap(blob,{premultiplyAlpha:'none',colorSpaceConversion:'none'});const t=gl.createTexture();gl.bindTexture(gl.TEXTURE_2D,t);gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL,false);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA,gl.RGBA,gl.UNSIGNED_BYTE,img);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_S,gl.CLAMP_TO_EDGE);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_T,gl.CLAMP_TO_EDGE);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.LINEAR);if((img.width&(img.width-1))===0&&(img.height&(img.height-1))===0){gl.generateMipmap(gl.TEXTURE_2D);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.LINEAR_MIPMAP_LINEAR);}else gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.LINEAR);img.close();return t;})();textures.set(url,promise);return promise;
  }
  const meshes=new Map();
  function bufferMesh(data){const vb=gl.createBuffer();gl.bindBuffer(gl.ARRAY_BUFFER,vb);gl.bufferData(gl.ARRAY_BUFFER,new Float32Array(data.vertices),gl.STATIC_DRAW);const ib=gl.createBuffer();gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER,ib);gl.bufferData(gl.ELEMENT_ARRAY_BUFFER,new Uint16Array(data.indices),gl.STATIC_DRAW);const center=[0,0,0],min=[Infinity,Infinity,Infinity],max=[-Infinity,-Infinity,-Infinity];for(let i=0;i<data.vertices.length;i+=5)for(let k=0;k<3;k++){min[k]=Math.min(min[k],data.vertices[i+k]);max[k]=Math.max(max[k],data.vertices[i+k]);}for(let k=0;k<3;k++)center[k]=(min[k]+max[k])/2;return {...data,vb,ib,count:data.indices.length,center};}
  let loadedMeshes=0;const meshTotal=Object.keys(manifest).length;
  await Promise.all(Object.entries(manifest).map(async([name,data])=>{const mesh=bufferMesh(data);mesh.textureObject=await texture(data.texture);meshes.set(name,mesh);loadedMeshes++;window.stuntPreloader?.phase('Loading scenery and aircraft…',0.12+0.6*loadedMeshes/meshTotal);}));
  for(const [name,file]of [['smoke-white','169_core_plane_smoke1.png'],['smoke-black','168_core_plane_smoke2.png']]){const mesh=bufferMesh({vertices:[-.5,-.5,0,0,0,.5,-.5,0,1,0,.5,.5,0,1,1,-.5,.5,0,0,1],indices:[0,1,2,0,2,3],transparent:true,cloud:true});mesh.textureObject=await texture('assets/'+file);meshes.set(name,mesh);}
  // AS3 Matrix3D.rawData and WebGL both use column-major matrices.
  const multiply=(a,b)=>{const o=new Float32Array(16);for(let c=0;c<4;c++)for(let r=0;r<4;r++)o[c*4+r]=a[r]*b[c*4]+a[4+r]*b[c*4+1]+a[8+r]*b[c*4+2]+a[12+r]*b[c*4+3];return o;};
  function inverseCamera(m){return new Float32Array([m[0],m[4],m[8],0,m[1],m[5],m[9],0,m[2],m[6],m[10],0,-(m[0]*m[12]+m[1]*m[13]+m[2]*m[14]),-(m[4]*m[12]+m[5]*m[13]+m[6]*m[14]),-(m[8]*m[12]+m[9]*m[13]+m[10]*m[14]),1]);}
  let latest=null,scheduled=false,unknown=new Set();
  function draw(){
    scheduled=false;if(!latest)return;
    const {objects,camera,fov,width,height,state}=latest;
    if(canvas.width!==width||canvas.height!==height){canvas.width=width;canvas.height=height;}
    gl.viewport(0,0,width,height);gl.clearColor(.12,.23,.34,1);gl.clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT);
    const focal=Math.hypot(width/2,height/2)/Math.tan(fov/2),near=state===1?1:10,far=100000;
    // Alternativa cameras look along +Z with screen Y pointing down.
    // Its field of view spans the viewport diagonal, rather than its height.
    const projection=new Float32Array([2*focal/width,0,0,0,0,-2*focal/height,0,0,0,0,(far+near)/(far-near),1,0,0,-2*far*near/(far-near),0]);
    const vp=multiply(projection,inverseCamera(camera)),opaque=[],transparent=[];
    for(const entry of objects){const name=entry.sprite?(entry.dark?'smoke-black':'smoke-white'):entry.name.split('::').pop();const mesh=meshes.get(name);if(!mesh){if(!unknown.has(name)){unknown.add(name);console.warn('GPU mesh missing',name);}continue;}let matrix=entry.matrix;if(entry.sprite){const c=Math.cos(entry.rotation),s=Math.sin(entry.rotation),w=entry.width,h=entry.height;matrix=[(camera[0]*c+camera[4]*s)*w,(camera[1]*c+camera[5]*s)*w,(camera[2]*c+camera[6]*s)*w,0,(-camera[0]*s+camera[4]*c)*h,(-camera[1]*s+camera[5]*c)*h,(-camera[2]*s+camera[6]*c)*h,0,camera[8],camera[9],camera[10],0,matrix[12],matrix[13],matrix[14],1];}const center=mesh.center;const p=[matrix[0]*center[0]+matrix[4]*center[1]+matrix[8]*center[2]+matrix[12],matrix[1]*center[0]+matrix[5]*center[1]+matrix[9]*center[2]+matrix[13],matrix[2]*center[0]+matrix[6]*center[1]+matrix[10]*center[2]+matrix[14]];const distance=p.reduce((n,v,k)=>n+(v-camera[12+k])**2,0);(mesh.transparent||entry.alpha<.999?transparent:opaque).push({mesh,matrix,alpha:entry.alpha,distance});}
    transparent.sort((a,b)=>b.distance-a.distance);
    gl.useProgram(program);
    for(const [list,depthWrite]of [[opaque,true],[transparent,false]]){gl.depthMask(depthWrite);for(const item of list){const mesh=item.mesh;gl.bindBuffer(gl.ARRAY_BUFFER,mesh.vb);gl.vertexAttribPointer(pos,3,gl.FLOAT,false,20,0);gl.vertexAttribPointer(uv,2,gl.FLOAT,false,20,12);gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER,mesh.ib);gl.bindTexture(gl.TEXTURE_2D,mesh.textureObject);gl.uniformMatrix4fv(mvpLocation,false,multiply(vp,item.matrix));gl.uniform1f(alphaLocation,item.alpha);gl.drawElements(gl.TRIANGLES,mesh.count,gl.UNSIGNED_SHORT,0);}}gl.depthMask(true);
    if(state===1)window.stuntPreloader?.finish();
  }
  window.stuntGpuFrame=function(objects,camera,fov,width,height,state){latest={objects,camera,fov,width,height,state};if(!scheduled){scheduled=true;requestAnimationFrame(draw);}return true;};
  status.textContent='Graphics ready. Loading the game…';
  return true;
})();
window.stuntGpuReady.catch(error=>{document.querySelector('#status').textContent='Graphics could not start: '+error.message;window.stuntPreloader?.fail('Graphics could not start. Please refresh to retry.');console.error(error);});
