'use strict';
const fs=require('fs'),path=require('path'),{spawnSync}=require('child_process');
const root=path.resolve(__dirname,'..'),variant=process.argv[2];
if(!['original','enhanced'].includes(variant))throw Error('Choose original or enhanced');
const texture=variant==='original'?'assets/172_procedural.ring_colormap.jpg':'assets/checkpoint-gold-v1.png';
if(!fs.existsSync(path.join(root,'player/gpu',texture)))throw Error('Texture missing: '+texture);
for(const name of ['player/gpu/meshes.json']){
 const target=path.join(root,name),manifest=JSON.parse(fs.readFileSync(target,'utf8'));
 manifest.ring.texture=texture;fs.writeFileSync(target,JSON.stringify(manifest));
}
const result=spawnSync(process.execPath,[path.join(__dirname,'package-website.cjs')],{cwd:root,encoding:'utf8',windowsHide:true});
if(result.error||result.status!==0)throw result.error||Error(result.stderr||'Could not package website');
console.log('Checkpoint texture: '+variant+'. Refresh the game. Upload folder and ZIP updated.');
