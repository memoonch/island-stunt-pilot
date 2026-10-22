const http = require('http');
const fs = require('fs');
const path = require('path');
const root = path.resolve(__dirname, '..');
const mime = {'.html':'text/html; charset=utf-8','.js':'text/javascript','.wasm':'application/wasm','.swf':'application/x-shockwave-flash','.json':'application/json','.png':'image/png'};
const server = http.createServer((req, res) => {
  let pathname;
  try { pathname = decodeURIComponent(new URL(req.url, 'http://localhost').pathname); }
  catch { res.writeHead(400); return res.end('Invalid URL'); }
  if (pathname === '/') pathname = '/player/recovered.html';
  const file = path.resolve(root, '.' + pathname);
  const relative = path.relative(root, file);
  if (relative.startsWith('..') || path.isAbsolute(relative) || !['player','build','original'].includes(relative.split(path.sep)[0])) {
    res.writeHead(403); return res.end('Forbidden');
  }
  let target = file;
  if (fs.existsSync(target) && fs.statSync(target).isDirectory()) target = path.join(target, 'index.html');
  fs.readFile(target, (error, bytes) => {
    if (error) { res.writeHead(404); return res.end('Not found'); }
    res.setHeader('Content-Type', mime[path.extname(target)] || 'application/octet-stream');
    res.setHeader('Cache-Control', 'no-cache');
    res.end(bytes);
  });
});
server.on('error', error => {
  console.error(error.code === 'EADDRINUSE' ? 'Port 8123 is already in use. Open http://127.0.0.1:8123/player/recovered.html if the recovery server is already running.' : error.message);
  process.exitCode = 1;
});
server.listen(8123, '127.0.0.1', () => console.log('Stunt Pilot: http://127.0.0.1:8123/player/recovered.html'));
