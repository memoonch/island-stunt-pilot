const fs=require('fs');
const path=require('path');
const root=path.resolve(__dirname,'..');
const scripts=path.join(root,'recovery/game/scripts/procedural');
const images=path.join(root,'recovery/game/images');
const out=path.join(root,'player/gpu/assets');
fs.mkdirSync(out,{recursive:true});
const imageNames=fs.readdirSync(images);
const meshes={};
const manifestPath=path.join(root,'player/gpu/meshes.json');
const prior=fs.existsSync(manifestPath)?JSON.parse(fs.readFileSync(manifestPath,'utf8')):{};
for(const file of fs.readdirSync(scripts)){
 const source=fs.readFileSync(path.join(scripts,file),'utf8');
 if(!/extends Mesh/.test(source))continue;
 const name=file.replace(/\.as$/,'');
 const colorClass=source.match(/colormap:Class\s*=\s*(\w+)/)?.[1];
 if(!colorClass)continue;
 const colorSource=fs.readFileSync(path.join(scripts,colorClass+'.as'),'utf8');
 const embedded=colorSource.match(/source="\/_assets\/(\d+)[^/"\r\n]*\.(png|jpg)"/);
 if(!embedded)throw Error('Texture reference missing: '+name);
 const imageName=imageNames.find(n=>n.startsWith(embedded[1]+'_')||n===embedded[1]+'.'+embedded[2]);
 if(!imageName)throw Error('Image missing '+name);
 const ids=new Map(),vertices=[],indices=[];
 for(const match of source.matchAll(/_geo\.addVertex\(([^;]+)\);/g)){
  const a=match[1].split(',').map(s=>s.trim());
  const id=a[5].replace(/"/g,'');
  ids.set(id,vertices.length/5);
  vertices.push(...a.slice(0,5).map(Number));
 }
 for(const match of source.matchAll(/_geo\.addFaceByIds\(\[([^\]]+)\]/g)){
  const face=match[1].split(',').map(s=>ids.get(s.trim().replace(/"/g,'')));
  if(face.some(i=>i===undefined))throw Error('Face vertex missing '+name);
  for(let i=1;i<face.length-1;i++)indices.push(face[0],face[i],face[i+1]);
 }
 if(!vertices.length||!indices.length||vertices.some(n=>!Number.isFinite(n)))throw Error('Invalid geometry '+name);
 fs.copyFileSync(path.join(images,imageName),path.join(out,imageName));
 meshes[name]={vertices,indices,texture:'assets/'+imageName,transparent:embedded[2]==='png',cloud:/cloud/.test(name)};
}
for(const n of ['168_core_plane_smoke2.png','169_core_plane_smoke1.png']) fs.copyFileSync(path.join(images,n),path.join(out,n));
for(const name of ['plane','hangar_plane']){
 if(prior[name]?.texture==='assets/plane-rich-v1.png'&&fs.existsSync(path.join(root,'player/gpu',prior[name].texture)))meshes[name].texture=prior[name].texture;
}
if(prior.ring?.texture==='assets/checkpoint-gold-v1.png'&&fs.existsSync(path.join(root,'player/gpu',prior.ring.texture)))meshes.ring.texture=prior.ring.texture;
fs.writeFileSync(manifestPath,JSON.stringify(meshes));
console.log('Exported '+Object.keys(meshes).length+' GPU meshes; '+Object.values(meshes).reduce((n,m)=>n+m.indices.length/3,0)+' triangles');
