const {spawn}=require('child_process');
const fs=require('fs');
const path=require('path');
const root=path.resolve(__dirname,'..');
const url='http://127.0.0.1:8123/player/'+(process.argv.includes('--classic')?'classic.html':process.argv.includes('--gpu')?'gpu.html':'recovered.html');
fs.mkdirSync(path.join(root,'logs'),{recursive:true});
async function ready(){try{const r=await fetch(url,{signal:AbortSignal.timeout(1000)});return r.ok&&(await r.text()).includes('Stunt Pilot');}catch{return false;}}
(async()=>{
 if(!await ready()){
  const out=fs.openSync(path.join(root,'logs/server.log'),'a');
  const err=fs.openSync(path.join(root,'logs/server-error.log'),'a');
  const child=spawn(process.execPath,['tools/serve.cjs'],{cwd:root,detached:true,windowsHide:true,stdio:['ignore',out,err]});
  child.unref();fs.closeSync(out);fs.closeSync(err);
  for(let i=0;i<20&&!await ready();i++)await new Promise(r=>setTimeout(r,250));
 }
 if(!await ready())throw Error('Unable to start game server; see logs/server-error.log');
 console.log(url);
 if(!process.argv.includes('--no-open')){
  const browser=spawn('explorer.exe',[url],{windowsHide:true,detached:true,stdio:'ignore'});
  browser.unref();
 }
})().catch(e=>{console.error(e.message);process.exitCode=1;});
