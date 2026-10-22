'use strict';
(function(){
  const game=document.querySelector('#game');
  function update(){
    const fullscreen=!!document.fullscreenElement || window.matchMedia('(display-mode: fullscreen)').matches ||
      (window.innerWidth>=screen.width-8 && window.innerHeight>=screen.height-8);
    document.documentElement.classList.toggle('viewport-fullscreen',fullscreen);
  }
  // Handle F11 directly where browser chrome does not provide the shortcut,
  // including embedded app browsers. Native fullscreen resize remains supported.
  window.addEventListener('keydown',event=>{
    if(event.repeat)return;
    if(event.key==='F11'){
      if(!document.fullscreenElement && !game.requestFullscreen)return;
      event.preventDefault();
      event.stopImmediatePropagation();
      const action=document.fullscreenElement?document.exitFullscreen():game.requestFullscreen();
      Promise.resolve(action).then(update).catch(error=>console.warn('Fullscreen request failed',error));
    }else if(event.key==='Escape' && document.fullscreenElement){
      event.preventDefault();
      event.stopImmediatePropagation();
      document.exitFullscreen().then(update).catch(error=>console.warn('Fullscreen exit failed',error));
    }
  },true);
  window.addEventListener('resize',update);
  document.addEventListener('fullscreenchange',update);
  update();
})();
