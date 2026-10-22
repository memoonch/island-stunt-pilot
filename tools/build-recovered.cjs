const {spawnSync}=require('child_process');
const path=require('path');
process.chdir(path.resolve(__dirname,'..'));
const sourceFile=process.argv[2]||'patches/sp2.as';
const outputFile=process.argv[3]||'build/stunt-pilot-recovered.swf';
const controlsFile=process.argv[4]||(path.basename(sourceFile)==='sp2-gpu.as'?'patches/core_plane.as':null);
function run(cmd,args){const r=spawnSync(cmd,args,{encoding:'utf8',windowsHide:true});if(r.stdout)process.stdout.write(r.stdout);if(r.stderr)process.stderr.write(r.stderr);if(r.error||r.status!==0)throw r.error||Error(cmd+' failed');return r.stdout;}
run('java',['-jar','ffdec/ffdec.jar','-replace','recovery/game.swf','build/stunt-pilot-texture-base.swf','sp2',sourceFile]);
if(controlsFile){
 run('java',['-jar','ffdec/ffdec.jar','-replace','build/stunt-pilot-texture-base.swf','build/stunt-pilot-controls-base.swf','core_plane',controlsFile]);
 require('fs').copyFileSync('build/stunt-pilot-controls-base.swf','build/stunt-pilot-texture-base.swf');
}
run(process.execPath,['tools/patch-texture.cjs']);
const found=run('java',['-cp','ffdec/ffdec.jar;ffdec/lib/*','tools/FindMethod.java','build/stunt-pilot-texture-base.swf']);
const index=found.match(/^(\d+) alternativa.*:draw/m)?.[1];
if(!index)throw Error('Texture draw method not found');
run('java',['-jar','ffdec/ffdec.jar','-replace','build/stunt-pilot-texture-base.swf',outputFile,'alternativa.engine3d.materials.TextureMaterial','patches/texture-draw.pcode',index]);
if(path.basename(sourceFile)==='sp2-gpu.as'){
 run('java',['-cp','ffdec/ffdec.jar;ffdec/lib/*','tools/PatchMenuText.java',outputFile,outputFile+'.menu.swf']);
 require('fs').copyFileSync(outputFile+'.menu.swf',outputFile);
 run('java',['-cp','ffdec/ffdec.jar;ffdec/lib/*','tools/PatchHudImages.java',outputFile,outputFile+'.hud.swf']);
 require('fs').copyFileSync(outputFile+'.hud.swf',outputFile);
}
console.log('Built '+outputFile);
