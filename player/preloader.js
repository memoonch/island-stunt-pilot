'use strict';
(()=>{
 const game=document.querySelector('#game'),overlay=document.createElement('div');
 overlay.id='preloader';
 overlay.setAttribute('aria-label','Loading Island Stunt Pilot');
 overlay.innerHTML='<div class="load-orbit"></div><div class="load-content"><div class="load-emblem" aria-hidden="true"><svg viewBox="0 0 48 48"><path d="M22 3h4l3 17 15 9v4l-15-5-2 12 5 4v2l-8-2-8 2v-2l5-4-2-12-15 5v-4l15-9z"/></svg></div><p class="load-eyebrow">PREPARE FOR TAKEOFF</p><h1 class="load-title">Island<span>STUNT PILOT</span></h1><div class="load-progress" role="progressbar" aria-label="Game loading" aria-valuemin="0" aria-valuemax="100" aria-valuenow="4"><div class="load-progress-fill"></div></div><p class="load-phase" role="status">Preparing your flight…</p><div class="load-tip"><span class="load-tip-label">HOW TO PLAY</span><p class="load-tip-text">Choose mouse or keyboard controls.<br>Arrow keys steer · Space boosts · P pauses</p></div></div>';
 game.append(overlay);
 const tips=[['HOW TO PLAY','Choose mouse or keyboard controls.<br>Arrow keys steer · Space boosts · P pauses'],['FLIGHT TIP','Fly through the highlighted ring first.<br>The arrows guide you toward your next checkpoint.'],['STAY IN CONTROL','Use small steering adjustments to line up your approach.<br>Save your boost for a clear flight path.'],['MAKE IT YOURS','Invert Y Axis changes your vertical controls.<br>You can change it before flying or in the pause menu.'],['TAKE A BREAK','Press P to pause and resume your flight.<br>Press F11 for a fullscreen view.']];
 let index=0,finished=false,progress=4,pending;
 const timer=setInterval(()=>{
  const card=overlay.querySelector('.load-tip');card.classList.add('is-changing');
  pending=setTimeout(()=>{index=(index+1)%tips.length;card.querySelector('.load-tip-label').textContent=tips[index][0];card.querySelector('.load-tip-text').innerHTML=tips[index][1];card.classList.remove('is-changing');},200);
 },3500);
 window.stuntPreloader={
  phase(label,value){if(finished)return;progress=Math.max(progress,Math.min(100,Math.round(value*100)));overlay.querySelector('.load-progress-fill').style.width=progress+'%';overlay.querySelector('[role="progressbar"]').setAttribute('aria-valuenow',String(progress));overlay.querySelector('.load-phase').textContent=label;},
  finish(){if(finished)return;this.phase('Ready for takeoff',1);finished=true;clearInterval(timer);clearTimeout(pending);overlay.classList.add('is-ready');setTimeout(()=>overlay.remove(),260);},
  fail(message){if(finished)return;finished=true;clearInterval(timer);clearTimeout(pending);overlay.querySelector('.load-phase').textContent=message;}
 };
})();
