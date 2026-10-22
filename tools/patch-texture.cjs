const fs=require('fs');
const source=fs.readFileSync('recovery/pcode/scripts/alternativa/engine3d/materials/TextureMaterial.pcode','utf8');
const start=source.indexOf('method\r\n',source.indexOf('override alternativa3d function draw('));
const end=source.indexOf('end ; method',start)+'end ; method'.length;
let method=source.slice(start,end);
const pattern=/getlocal2\s+getproperty QName\(Namespace\("http:\/\/alternativaplatform.com\/en\/alternativa3d"\),"gfx"\)\s+getlocal 23\s+getlocal 25\s+getlocal 24\s+pushstring "none"\s+callproperty QName\(PackageNamespace\(""\),"drawTriangles"\), 4/g;
let count=0;
method=method.replace(pattern,()=>{count++;return `getlex QName(PackageNamespace(""),"sp2")
getlocal2
getproperty QName(Namespace("http://alternativaplatform.com/en/alternativa3d"),"gfx")
getlocal 20
getlocal 23
getlocal 25
getlocal 24
getlocal0
getproperty QName(PackageNamespace(""),"repeat")
getlocal0
getproperty QName(PackageNamespace(""),"smooth")
callproperty QName(PackageNamespace(""),"drawCompatibleTriangles"), 7`;});
if(count!==2)throw Error('Expected 2 calls, got '+count);
method=method.replace(/maxstack (\d+)/,(_,n)=>'maxstack '+(Number(n)+4));
fs.writeFileSync('patches/texture-draw.pcode',method);
console.log('Patched '+count+' calls');
