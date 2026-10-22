package
{
   import alternativa.engine3d.core.*;
   import alternativa.engine3d.materials.*;
   import alternativa.engine3d.objects.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import jiglib.geometry.*;
   import jiglib.math.*;
   import jiglib.physics.*;
   import jiglib.plugin.alternativa3d.*;
   import procedural.*;
   
   [SWF(width="640", height="400", backgroundColor="#004080", frameRate="30")]
   [SWF(width="640",height="400",backgroundColor="#004080",frameRate="30")]
   public class sp2 extends MovieClip
   {
      
      protected static var scrTitle:Sprite = null;
      
      protected static var scrStatWin:Sprite = null;
      
      protected static var scrStatFail:Sprite = null;
      
      private static const scr_win:Class = sp2_scr_win;
      
      protected static var scrWin:Sprite = null;
      
      private static const scr_instructions:Class = sp2_scr_instructions;
      
      protected static var scrInstructions:Sprite = null;
      
      private static const pausegfx:Class = sp2_pausegfx;
      
      protected static var gfxPaused:Sprite = new pausegfx();
      
      private static const arrowgfx:Class = sp2_arrowgfx;
      
      protected static var gfxArrow:DisplayObject = new arrowgfx();
      
      private static const hudgfx:Class = sp2_hudgfx;
      
      protected static var gfxHud:Sprite = new hudgfx();
      
      private static const cdgfx:Class = sp2_cdgfx;
      
      protected static var gfxCount:MovieClip = new cdgfx();
      
      private static const fadergfx:Class = sp2_fadergfx;
      
      protected static var gfxFader:Sprite = new fadergfx();
      
      private static const snd_cppass:Class = sp2_snd_cppass;
      
      private static const snd_fail:Class = sp2_snd_fail;
      
      private var fCheat:Boolean = false;
      
      protected var scr_title:Class = sp2_scr_title;
      
      protected var scr_stat_win:Class = sp2_scr_stat_win;
      
      protected var scr_stat_fail:Class = sp2_scr_stat_fail;
      
      protected var sndCPPass:MP3Player = new MP3Player(new snd_cppass() as Sound,true);
      
      protected var sndFail:MP3Player = new MP3Player(new snd_fail() as Sound,true);
      
      private var coreInterface:core_interface;
      
      private var levelNum:int = 0;
      
      private var excluderPos:Vector.<Vector3D> = new Vector.<Vector3D>();
      
      private var excluderSize:Vector.<Number> = new Vector.<Number>();
      
      private var excluderMatrices:Vector.<Vector3D> = new Vector.<Vector3D>();
      
      private var checkPoints:Vector.<Matrix3D> = new Vector.<Matrix3D>();
      
      private var models:Vector.<Mesh> = new Vector.<Mesh>();
      
      private var gameState:int = 0;
      
      private var last_time:Number;
      
      private var game_time:Number;
      
      private var level_time:Number;
      
      private var mouseControl:Boolean;
      
      private var lives:uint;
      
      private var _player:core_plane;
      
      private var ringIndicator:Mesh = new ring_indicator();
      
      private var _frameCounter:uint;
      
      private var _fadeOutTime:Number;
      
      private var _invertYAxis:Number = -1;
      
      private var _levelSuccess:Boolean;
      
      private var _gameSuccess:Boolean = false;
      
      private var startLampActive:Boolean;
      
      private var Fog:fog = new fog();
      
      public function sp2()
      {
         super();
      }
      
      public function start(api:fog) : *
      {
         this.Fog = api;
         if(stage != null)
         {
            this.init3D();
         }
         else
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         }
      }
      
      private function addedToStage(e:Event) : void
      {
         if(stage != null)
         {
            this.init3D();
         }
      }
      
      private function init3D() : void
      {
         stage.stageFocusRect = false;
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler);
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.addEventListener(Event.RESIZE,this.onResize);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseUpDown);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpDown);
         this.coreInterface = new core_interface(this);
         this._player = new core_plane(this.coreInterface);
         this.processFrontend(true);
      }
      
      private function reset() : void
      {
         this.levelNum = 0;
         this.lives = 3;
         this.game_time = 0;
      }
      
      private function processFrontend(create:Boolean) : void
      {
         if(create)
         {
            scrTitle = new this.scr_title() as Sprite;
            addChild(scrTitle);
            scrTitle.getChildByName("btn_play").addEventListener(MouseEvent.CLICK,this.onPlayGamePre);
            scrTitle.getChildByName("btn_addthisgame").addEventListener(MouseEvent.CLICK,this.addGame);
            scrTitle.getChildByName("appGet_btn").addEventListener(MouseEvent.CLICK,this.appGet);
            scrTitle.getChildByName("appGetPlay_btn").addEventListener(MouseEvent.CLICK,this.appGetPlay);
            scrTitle.getChildByName("appGetAmazon_btn").addEventListener(MouseEvent.CLICK,this.appGetAmazon);
            scrTitle.getChildByName("fader").visible = true;
            scrTitle.getChildByName("fader").alpha = 1;
            this.addMeshToLevel(new hangar_roof(),true);
            this.addMeshToLevel(new hangar_floor(),true);
            this.addMeshToLevel(new hangar_plane(),true);
            this.addMeshToLevel(new hangar_propeller(),true);
            if(this._gameSuccess)
            {
               this.addMeshToLevel(new hangar_trophy(),true);
            }
            this.gameState = core_gamestate.FRONTEND;
            this.coreInterface.camera.fov = 75 * (Math.PI / 180);
            this.updateCamera(1);
         }
         else
         {
            removeChild(scrTitle);
            scrTitle = null;
         }
      }
      
      private function onPlayGamePre(e:MouseEvent) : void
      {
         this.processFrontend(false);
         this.processInstructions(true);
      }
      
      public function moreGames(e:Event) : void
      {
         this.Fog.gotoMore();
      }
      
      public function addGame(e:Event) : void
      {
         this.Fog.gotoFreeGames();
      }
      
      public function appGet(e:Event) : void
      {
         navigateToURL(new URLRequest("https://itunes.apple.com/us/app/3d-stunt-pilot-san-francisco/id860597633?ls=1&mt=8"));
      }
      
      public function appGetPlay(e:Event) : void
      {
         navigateToURL(new URLRequest("https://play.google.com/store/apps/details?id=com.FreeOnlineGames.StuntPilot3DSanFrancisco"));
      }
      
      public function appGetAmazon(e:Event) : void
      {
         navigateToURL(new URLRequest("http://www.amazon.com/3D-Stunt-Pilot-San-Francisco/dp/B00JWT4N6W/ref=sr_1_1?ie=UTF8&qid=1398426896&sr=8-1&keywords=3D+Stunt+Pilot+-+San+Francisco"));
      }
      
      private function processInstructions(create:Boolean) : void
      {
         if(create)
         {
            scrInstructions = new scr_instructions() as Sprite;
            addChild(scrInstructions);
            scrInstructions.getChildByName("btn_continue_mouse").addEventListener(MouseEvent.CLICK,this.onPlayGameMouse);
            scrInstructions.getChildByName("btn_continue_keyboard").addEventListener(MouseEvent.CLICK,this.onPlayGameKeyboard);
            scrInstructions.getChildByName("btn_invert").addEventListener(MouseEvent.CLICK,this.onInvertY);
            scrInstructions.getChildByName("btn_inverted").addEventListener(MouseEvent.CLICK,this.onInvertY);
            this.updateInvertY();
         }
         else
         {
            removeChild(scrInstructions);
            scrInstructions = null;
            this.removeModels();
         }
      }
      
      private function removeModels() : void
      {
         while(Boolean(this.models.length))
         {
            this.coreInterface.sceneRoot.removeChild(this.models[this.models.length - 1]);
            this.models[this.models.length - 1] = null;
            this.models.pop();
         }
      }
      
      private function updateInvertY() : void
      {
         scrInstructions.getChildByName("btn_invert").visible = this._invertYAxis != 1;
         scrInstructions.getChildByName("btn_inverted").visible = this._invertYAxis == 1;
         this._player.setInvertY(this._invertYAxis);
      }
      
      private function onInvertY(e:MouseEvent) : void
      {
         this._invertYAxis *= -1;
         this.updateInvertY();
      }
      
      private function onPlayGameMouse(e:MouseEvent) : void
      {
         this.mouseControl = true;
         this.processInstructions(false);
         this.reset();
         this.prepareFadeToBlack();
         this.gameState = core_gamestate.MENUFADEOUT;
      }
      
      private function onPlayGameKeyboard(e:MouseEvent) : void
      {
         this.mouseControl = false;
         this.processInstructions(false);
         this.reset();
         this.prepareFadeToBlack();
         this.gameState = core_gamestate.MENUFADEOUT;
      }
      
      private function processStatScreen(create:Boolean) : void
      {
         if(this._levelSuccess)
         {
            if(create)
            {
               scrStatWin = new this.scr_stat_win() as Sprite;
               addChild(scrStatWin);
               scrStatWin.getChildByName("btn_continue").addEventListener(MouseEvent.CLICK,this.onContinueFromStat);
               scrStatWin.getChildByName("appGet_btn").addEventListener(MouseEvent.CLICK,this.appGet);
               scrStatWin.getChildByName("appGetPlay_btn").addEventListener(MouseEvent.CLICK,this.appGetPlay);
               scrStatWin.getChildByName("appGetAmazon_btn").addEventListener(MouseEvent.CLICK,this.appGetAmazon);
               scrStatWin.getChildByName("fader").visible = false;
               scrStatWin.getChildByName("fader").alpha = 0;
               (scrStatWin.getChildByName("overall_time") as TextField).text = this.coreInterface.formatTime(this.level_time);
               this._fadeOutTime = 5;
            }
            else
            {
               removeChild(scrStatWin);
               scrStatWin = null;
            }
         }
         else if(create)
         {
            scrStatFail = new this.scr_stat_fail() as Sprite;
            addChild(scrStatFail);
            scrStatFail.getChildByName("btn_retry").addEventListener(MouseEvent.CLICK,this.onRetryFromStat);
            scrStatFail.getChildByName("appGet_btn").addEventListener(MouseEvent.CLICK,this.appGet);
            scrStatFail.getChildByName("appGetPlay_btn").addEventListener(MouseEvent.CLICK,this.appGetPlay);
            scrStatFail.getChildByName("appGetAmazon_btn").addEventListener(MouseEvent.CLICK,this.appGetAmazon);
            scrStatFail.getChildByName("fader").visible = false;
            scrStatFail.getChildByName("fader").alpha = 0;
            this._fadeOutTime = 5;
         }
         else
         {
            removeChild(scrStatFail);
            scrStatFail = null;
         }
      }
      
      private function onContinueFromStat(e:MouseEvent) : void
      {
         this.processStatScreen(false);
         ++this.levelNum;
         this.stopGame(false);
         this.startGame();
      }
      
      private function onRetryFromStat(e:MouseEvent) : void
      {
         this.processStatScreen(false);
         if(Boolean(this.lives))
         {
            this.stopGame(false);
            this.startGame();
         }
         else
         {
            this.stopGame(true);
         }
      }
      
      private function processWin(create:Boolean) : void
      {
         if(create)
         {
            this._gameSuccess = true;
            scrWin = new scr_win() as Sprite;
            addChild(scrWin);
            scrWin.getChildByName("btn_continue").addEventListener(MouseEvent.CLICK,this.onFinishGame);
            scrWin.getChildByName("appGet_btn").addEventListener(MouseEvent.CLICK,this.appGet);
            scrWin.getChildByName("appGetPlay_btn").addEventListener(MouseEvent.CLICK,this.appGetPlay);
            scrWin.getChildByName("appGetAmazon_btn").addEventListener(MouseEvent.CLICK,this.appGetAmazon);
            (scrWin.getChildByName("average_time") as TextField).text = this.coreInterface.formatTime(this.game_time / 12);
            (scrWin.getChildByName("overall_time") as TextField).text = this.coreInterface.formatTime(this.game_time);
            this.Fog.submitScore(this.game_time);
            this._fadeOutTime = 5;
         }
         else
         {
            removeChild(scrWin);
            scrWin = null;
         }
      }
      
      private function onFinishGame(e:MouseEvent) : void
      {
         this.processWin(false);
         this.levelNum = 0;
         this.stopGame(true);
      }
      
      private function createAlcatraz() : void
      {
         this.addMeshToLevel(new alcatraz_alpha(),true);
         this.addMeshToLevel(new alcatraz_bridge(),true);
         this.addMeshToLevel(new alcatraz_clouds(),true);
         this.addMeshToLevel(new alcatraz_island(),true);
         this.addMeshToLevel(new alcatraz_sky(),true);
         this.addMeshToLevel(new alcatraz_trees(),true);
         this.addMeshToLevel(new alcatraz_water(),true);
         this.excluderMatrices.push(new Vector3D(-5300.37,648.047,-573.583));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.432,370.044,500.44));
         this.excluderMatrices.push(new Vector3D(-5066.01,644.317,-310.147));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(392.951,377.974,348.899));
         this.excluderMatrices.push(new Vector3D(-4717.99,648.449,-366.535));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(313.656,369.198,232.599));
         this.excluderMatrices.push(new Vector3D(-3266.46,589.27,-119.336));
         this.excluderMatrices.push(new Vector3D(0,-20,0));
         this.excluderMatrices.push(new Vector3D(2023.51,242.971,578.145));
         this.excluderMatrices.push(new Vector3D(2206.58,293.556,-2349.47));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1678.04,419.155,458.529));
         this.excluderMatrices.push(new Vector3D(3017.4,293.556,-2234.19));
         this.excluderMatrices.push(new Vector3D(0,-55,0));
         this.excluderMatrices.push(new Vector3D(519.754,419.155,458.529));
         this.excluderMatrices.push(new Vector3D(-4168.98,324.083,-1840.46));
         this.excluderMatrices.push(new Vector3D(0,33.786,0));
         this.excluderMatrices.push(new Vector3D(578.852,239.233,399.12));
         this.excluderMatrices.push(new Vector3D(-4462.39,289.545,-1614.84));
         this.excluderMatrices.push(new Vector3D(0,33.786,0));
         this.excluderMatrices.push(new Vector3D(182.461,239.233,236.359));
         this.excluderMatrices.push(new Vector3D(-4367.39,287.561,-2016.58));
         this.excluderMatrices.push(new Vector3D(0,33.786,0));
         this.excluderMatrices.push(new Vector3D(182.461,239.233,236.359));
         this.excluderMatrices.push(new Vector3D(-3453.25,351.141,-2121.67));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(789.966,367.571,261.312));
         this.excluderMatrices.push(new Vector3D(-3892.43,321.737,-2097.1));
         this.excluderMatrices.push(new Vector3D(0,19.664,0));
         this.excluderMatrices.push(new Vector3D(231.725,239.233,236.359));
         this.excluderMatrices.push(new Vector3D(2706.14,910.508,-769.973));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(196.868,221.789,206.837));
         this.excluderMatrices.push(new Vector3D(2704.89,1326.79,-762.497));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(139.552,633.817,137.06));
         this.excluderMatrices.push(new Vector3D(2232.66,44.956,-3005.3));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1844.08,89.912,408.689));
         this.excluderMatrices.push(new Vector3D(322.637,1054.84,-726.742));
         this.excluderMatrices.push(new Vector3D(0,-10,0));
         this.excluderMatrices.push(new Vector3D(1105.2,457.938,934.203));
         this.excluderMatrices.push(new Vector3D(795.087,1054.84,-858.134));
         this.excluderMatrices.push(new Vector3D(0,-10,0));
         this.excluderMatrices.push(new Vector3D(1138.35,457.938,775.388));
         this.excluderMatrices.push(new Vector3D(1632.77,1054.84,-764.703));
         this.excluderMatrices.push(new Vector3D(0,-10,0));
         this.excluderMatrices.push(new Vector3D(557.304,457.938,678.912));
         this.excluderMatrices.push(new Vector3D(-750.734,1054.84,-1008.8));
         this.excluderMatrices.push(new Vector3D(0,-10,0));
         this.excluderMatrices.push(new Vector3D(1119.67,457.938,529.551));
         this.excluderMatrices.push(new Vector3D(-1312.74,1054.84,-1115.65));
         this.excluderMatrices.push(new Vector3D(0,-10,0));
         this.excluderMatrices.push(new Vector3D(291.115,457.938,342.143));
         this.excluderMatrices.push(new Vector3D(-1546.69,922.863,-283.01));
         this.excluderMatrices.push(new Vector3D(0,-15,0));
         this.excluderMatrices.push(new Vector3D(1585.43,169.163,49.468));
         this.excluderMatrices.push(new Vector3D(-2183.02,922.863,-907.519));
         this.excluderMatrices.push(new Vector3D(0,-105,0));
         this.excluderMatrices.push(new Vector3D(935.404,169.163,49.468));
         this.excluderMatrices.push(new Vector3D(-692.216,922.863,-509.756));
         this.excluderMatrices.push(new Vector3D(0,-105,0));
         this.excluderMatrices.push(new Vector3D(935.404,169.163,49.468));
         this.excluderMatrices.push(new Vector3D(-1324.51,922.863,-1129.64));
         this.excluderMatrices.push(new Vector3D(0,-15,0));
         this.excluderMatrices.push(new Vector3D(1585.43,169.163,49.468));
         this.excluderMatrices.push(new Vector3D(-4826.98,545.351,-1250.44));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-1605.1,626.735,564.637));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-205.669,626.735,615.593));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(851.625,657.587,631.479));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(2236.56,677.142,628.317));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(3410.92,803.676,258.045));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(3878.66,803.676,381.181));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(4304.66,892.594,63.236));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(4946.12,965.66,-872.572));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(5490.27,965.66,-864.127));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(5228.54,965.66,-1264.17));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(4519.62,714.211,-2126.29));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(3655.28,484.859,-2347.11));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(1142.23,321.1,-2250.83));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(623.03,265.516,-2447.16));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(1762.02,993.766,-1498.49));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(929.868,993.766,-1510.2));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(198.525,993.766,-1615.53));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-710.942,993.766,-1646.34));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-3201.18,1018.97,-943.767));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-2973.73,1018.97,-1276.89));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15,357.623,15));
         this.excluderMatrices.push(new Vector3D(-2455.64,1169.51,-1237.33));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(195.349,647.235,324.548));
         this.excluderMatrices.push(new Vector3D(-2455.64,1169.51,-1237.33));
         this.excluderMatrices.push(new Vector3D(0,60,0));
         this.excluderMatrices.push(new Vector3D(195.349,647.235,324.548));
         this.excluderMatrices.push(new Vector3D(-2455.64,1169.51,-1237.33));
         this.excluderMatrices.push(new Vector3D(0,120,0));
         this.excluderMatrices.push(new Vector3D(195.349,647.235,324.548));
         this.excluderMatrices.push(new Vector3D(-909.87,623.334,132.56));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(-909.87,755.082,145.012));
         this.excluderMatrices.push(new Vector3D(25,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(-909.87,790.669,199.088));
         this.excluderMatrices.push(new Vector3D(75,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(612.515,609.072,515.069));
         this.excluderMatrices.push(new Vector3D(0,-175,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(611.43,740.82,502.665));
         this.excluderMatrices.push(new Vector3D(25,-175,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(606.717,776.407,448.795));
         this.excluderMatrices.push(new Vector3D(75,-175,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(1570.88,678.478,88.697));
         this.excluderMatrices.push(new Vector3D(0,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(1574.1,810.227,100.724));
         this.excluderMatrices.push(new Vector3D(25,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(1588.1,845.814,152.957));
         this.excluderMatrices.push(new Vector3D(75,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(2924.93,783.384,-356.492));
         this.excluderMatrices.push(new Vector3D(0,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(2928.15,915.133,-344.465));
         this.excluderMatrices.push(new Vector3D(25,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(2942.15,950.72,-292.231));
         this.excluderMatrices.push(new Vector3D(75,15,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(3734.01,901.322,-545.137));
         this.excluderMatrices.push(new Vector3D(0,-180,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(3734.01,1033.07,-557.589));
         this.excluderMatrices.push(new Vector3D(25,-180,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(3734.01,1068.66,-611.665));
         this.excluderMatrices.push(new Vector3D(75,-180,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(4608.06,901.322,-886.884));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(4595.61,1033.07,-886.884));
         this.excluderMatrices.push(new Vector3D(25,-90,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(4541.53,1068.66,-886.884));
         this.excluderMatrices.push(new Vector3D(75,-90,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(3596.78,901.322,-1639.05));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(3596.78,1033.07,-1626.6));
         this.excluderMatrices.push(new Vector3D(25,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(3596.78,1068.66,-1572.52));
         this.excluderMatrices.push(new Vector3D(75,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(-1343.61,445.42,-2606.07));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,215.628,7.752));
         this.excluderMatrices.push(new Vector3D(-1343.61,577.169,-2593.62));
         this.excluderMatrices.push(new Vector3D(25,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,51.751,7.752));
         this.excluderMatrices.push(new Vector3D(-1343.61,612.756,-2539.54));
         this.excluderMatrices.push(new Vector3D(75,0,0));
         this.excluderMatrices.push(new Vector3D(14.47,91.423,7.752));
         this.excluderMatrices.push(new Vector3D(-5139.97,237.325,-606.355));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,955.965));
         this.excluderMatrices.push(new Vector3D(-5039.26,144.094,-1148.37));
         this.excluderMatrices.push(new Vector3D(-15.055,-33.703,4.829));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,813.83));
         this.excluderMatrices.push(new Vector3D(-4307.96,-6.41,-1710.45));
         this.excluderMatrices.push(new Vector3D(0,-60,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-3141.73,-6.41,-2022.7));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-1680.37,146.557,-2187.31));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-314.084,53.586,-2244.44));
         this.excluderMatrices.push(new Vector3D(-10,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(1841.85,-124.052,-2312.92));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(969.237,474.649,2917.59));
         this.excluderMatrices.push(new Vector3D(3973.72,37.922,-2187.74));
         this.excluderMatrices.push(new Vector3D(20,-105,0));
         this.excluderMatrices.push(new Vector3D(969.237,721.467,1451.54));
         this.excluderMatrices.push(new Vector3D(2777.37,480.898,-1296.02));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,764.186,1395.71));
         this.excluderMatrices.push(new Vector3D(4173.39,531.934,-1296.6));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,650.27,1395.71));
         this.excluderMatrices.push(new Vector3D(4154.9,539.038,-458.755));
         this.excluderMatrices.push(new Vector3D(0,-90,-10));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(4121.75,414.466,269.59));
         this.excluderMatrices.push(new Vector3D(6.754,-79.849,-9.847));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(5254.38,562.676,-930.599));
         this.excluderMatrices.push(new Vector3D(0,180,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(4880.08,475.453,-140.05));
         this.excluderMatrices.push(new Vector3D(-5,125,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(1009.69,231.311,448.953));
         this.excluderMatrices.push(new Vector3D(0,-80,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(2422.99,360.113,185.288));
         this.excluderMatrices.push(new Vector3D(5.655,-78.195,-8.842));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(2978.61,325.556,436.276));
         this.excluderMatrices.push(new Vector3D(5.077,-79.12,-9.962));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-55.013,231.311,267.978));
         this.excluderMatrices.push(new Vector3D(0,-115,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-4337.19,237.325,-623.863));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,955.965));
         this.excluderMatrices.push(new Vector3D(-3028.53,237.325,-190.747));
         this.excluderMatrices.push(new Vector3D(0,-20,0));
         this.excluderMatrices.push(new Vector3D(2194.8,474.649,955.965));
         this.excluderMatrices.push(new Vector3D(-1692.08,237.325,445.62));
         this.excluderMatrices.push(new Vector3D(0,-40,0));
         this.excluderMatrices.push(new Vector3D(768.18,474.649,955.965));
         this.excluderMatrices.push(new Vector3D(-1213.51,237.325,354.274));
         this.excluderMatrices.push(new Vector3D(0,-65,0));
         this.excluderMatrices.push(new Vector3D(768.18,474.649,1280.99));
         this.excluderMatrices.push(new Vector3D(-2768.72,336.691,-1273.56));
         this.excluderMatrices.push(new Vector3D(0,-80,0));
         this.excluderMatrices.push(new Vector3D(801.022,1018.22,1395.71));
         this.excluderMatrices.push(new Vector3D(-3025.7,438.519,-773.856));
         this.excluderMatrices.push(new Vector3D(0,-110,0));
         this.excluderMatrices.push(new Vector3D(584.746,821.144,1995.86));
         this.excluderMatrices.push(new Vector3D(-1279,614.942,-1865.96));
         this.excluderMatrices.push(new Vector3D(0,-85,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-208.23,478.445,-1608.95));
         this.excluderMatrices.push(new Vector3D(0,-115,0));
         this.excluderMatrices.push(new Vector3D(801.022,741.45,1395.71));
         this.excluderMatrices.push(new Vector3D(1534.65,445.772,-1305.81));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,816.397,2526.23));
         this.excluderMatrices.push(new Vector3D(1660.35,620.715,-683.571));
         this.excluderMatrices.push(new Vector3D(0,-75,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,2526.23));
         this.excluderMatrices.push(new Vector3D(-850.308,620.715,-462.375));
         this.excluderMatrices.push(new Vector3D(0,-95,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,2778.85));
         this.excluderMatrices.push(new Vector3D(3986.17,199.007,821.951));
         this.excluderMatrices.push(new Vector3D(0,-76.677,-70.817));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,2344.79));
         this.excluderMatrices.push(new Vector3D(5504.35,322.921,60.647));
         this.excluderMatrices.push(new Vector3D(0,-39.575,-66.44));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1336.53));
         this.excluderMatrices.push(new Vector3D(5835.87,318.221,-1013.94));
         this.excluderMatrices.push(new Vector3D(-0.229,4.249,-72.368));
         this.excluderMatrices.push(new Vector3D(978.849,101.248,1296.43));
         this.excluderMatrices.push(new Vector3D(5206.44,224.143,-2140.1));
         this.excluderMatrices.push(new Vector3D(1.97,51.341,-71.46));
         this.excluderMatrices.push(new Vector3D(978.849,101.248,1296.43));
         this.excluderMatrices.push(new Vector3D(4159.48,-38.108,-2719.89));
         this.excluderMatrices.push(new Vector3D(-65.054,13.304,-62.915));
         this.excluderMatrices.push(new Vector3D(978.849,101.248,1296.43));
         this.excluderMatrices.push(new Vector3D(2368.63,107.123,983.192));
         this.excluderMatrices.push(new Vector3D(0,-104.733,-66.025));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1196.78));
         this.excluderMatrices.push(new Vector3D(1143.09,108.984,980.047));
         this.excluderMatrices.push(new Vector3D(0,-80.668,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1340.39));
         this.excluderMatrices.push(new Vector3D(-155.495,108.984,788.144));
         this.excluderMatrices.push(new Vector3D(0,-114.268,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1340.39));
         this.excluderMatrices.push(new Vector3D(-1116.25,108.984,879.262));
         this.excluderMatrices.push(new Vector3D(0,-65.846,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1340.39));
         this.excluderMatrices.push(new Vector3D(-2202.94,108.984,802.594));
         this.excluderMatrices.push(new Vector3D(0,-122.7,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1125.93));
         this.excluderMatrices.push(new Vector3D(-3430.1,108.984,229.275));
         this.excluderMatrices.push(new Vector3D(0,-112.422,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,2037.94));
         this.excluderMatrices.push(new Vector3D(-4813.48,108.984,-54.202));
         this.excluderMatrices.push(new Vector3D(0,-88.502,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1263.52));
         this.excluderMatrices.push(new Vector3D(-5704.07,108.984,-746.247));
         this.excluderMatrices.push(new Vector3D(0,-176.535,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,859.194));
         this.excluderMatrices.push(new Vector3D(-4542.07,-120.186,-2203.24));
         this.excluderMatrices.push(new Vector3D(0,122.223,-63.674));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1675.43));
         this.excluderMatrices.push(new Vector3D(-3105.7,-113.919,-2615.06));
         this.excluderMatrices.push(new Vector3D(0,91.684,-55.354));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1675.43));
         this.excluderMatrices.push(new Vector3D(-1183.74,55.579,-2850.82));
         this.excluderMatrices.push(new Vector3D(0,91.339,-44.358));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1675.43));
         this.excluderMatrices.push(new Vector3D(436.184,-91.69,-2970.23));
         this.excluderMatrices.push(new Vector3D(8.318,97.333,-43.161));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1675.43));
         this.excluderMatrices.push(new Vector3D(-5461.42,35.301,-1481.73));
         this.excluderMatrices.push(new Vector3D(0,135.684,-65.001));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,859.194));
         this.excluderMatrices.push(new Vector3D(-1280.63,614.942,-1160.8));
         this.excluderMatrices.push(new Vector3D(0,-85,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,2596.02));
         this.excluderMatrices.push(new Vector3D(-1895.34,614.942,-1627.64));
         this.excluderMatrices.push(new Vector3D(0,-35.132,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,882.646));
         this.excluderMatrices.push(new Vector3D(-3863.48,-6.41,-1197.03));
         this.excluderMatrices.push(new Vector3D(0,-60,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-1541.22,55.579,-2743.32));
         this.excluderMatrices.push(new Vector3D(0,91.339,-44.358));
         this.excluderMatrices.push(new Vector3D(752.961,100.246,1675.43));
         this.excluderMatrices.push(new Vector3D(3069.07,325.556,-395.578));
         this.excluderMatrices.push(new Vector3D(5.077,-79.12,-9.962));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(4761.1,416.559,-1658.52));
         this.excluderMatrices.push(new Vector3D(7.941,-126.647,2.329));
         this.excluderMatrices.push(new Vector3D(969.237,721.467,972.53));
         this.excluderMatrices.push(new Vector3D(1841.85,-124.052,-1411.28));
         this.excluderMatrices.push(new Vector3D(0,-90,0));
         this.excluderMatrices.push(new Vector3D(969.237,474.649,2917.59));
         this.excluderMatrices.push(new Vector3D(-3450.95,603.74,-2182.66));
         this.excluderMatrices.push(new Vector3D(-45,0,0));
         this.excluderMatrices.push(new Vector3D(780.558,14.617,178.783));
         this.excluderMatrices.push(new Vector3D(-3450.95,593.404,-2061.85));
         this.excluderMatrices.push(new Vector3D(-135,0,0));
         this.excluderMatrices.push(new Vector3D(780.558,14.617,178.783));
         this.excluderMatrices.push(new Vector3D(2156.37,576.348,-2238.41));
         this.excluderMatrices.push(new Vector3D(35,0,0));
         this.excluderMatrices.push(new Vector3D(1568.99,31.008,279.401));
         this.excluderMatrices.push(new Vector3D(2156.37,572.701,-2459.47));
         this.excluderMatrices.push(new Vector3D(-40,0,0));
         this.excluderMatrices.push(new Vector3D(1568.99,31.008,279.401));
         this.excluderMatrices.push(new Vector3D(3133.3,572.701,-2257.71));
         this.excluderMatrices.push(new Vector3D(-40,-55,0));
         this.excluderMatrices.push(new Vector3D(414.214,31.008,279.401));
         this.excluderMatrices.push(new Vector3D(2958.17,572.701,-2142.66));
         this.excluderMatrices.push(new Vector3D(-40,125,0));
         this.excluderMatrices.push(new Vector3D(414.214,31.008,279.401));
         this.excluderMatrices.push(new Vector3D(-4232.9,461.197,-2130.14));
         this.excluderMatrices.push(new Vector3D(0,33.786,0));
         this.excluderMatrices.push(new Vector3D(50.067,485.642,53.606));
         this.excluderMatrices.push(new Vector3D(2210.62,360.113,-603.993));
         this.excluderMatrices.push(new Vector3D(5.655,-78.195,-8.842));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(797.321,231.311,-340.328));
         this.excluderMatrices.push(new Vector3D(0,-80,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.excluderMatrices.push(new Vector3D(-314.084,53.586,-1453.76));
         this.excluderMatrices.push(new Vector3D(-10,-90,0));
         this.excluderMatrices.push(new Vector3D(801.022,474.649,1395.71));
         this.coreInterface.generateBoxes(this.excluderMatrices);
      }
      
      private function createSanFrancisco() : void
      {
         this.addMeshToLevel(new san_francisco_buildings_01(),true);
         this.addMeshToLevel(new san_francisco_buildings_02(),true);
         this.addMeshToLevel(new san_francisco_buildings_03(),true);
         this.addMeshToLevel(new san_francisco_ground(),true);
         this.addMeshToLevel(new san_francisco_roofdetail(),true);
         this.addMeshToLevel(new san_francisco_sky(),true);
         this.addMeshToLevel(new san_francisco_trees(),true);
         this.excluderMatrices.push(new Vector3D(-2998.79,419.556,6191.16));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1749.33,839.111,746.24));
         this.excluderMatrices.push(new Vector3D(-2344.56,1064.71,5604.11));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(406.226,2129.42,412.444));
         this.excluderMatrices.push(new Vector3D(-3657.21,1063.11,5586.07));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(406.226,2126.22,410.289));
         this.excluderMatrices.push(new Vector3D(-2998.78,423.111,5013.5));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1706.67,846.222,746.24));
         this.excluderMatrices.push(new Vector3D(-1614.2,1065.15,6353.72));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(423.745,2130.3,437.688));
         this.excluderMatrices.push(new Vector3D(-1023.56,678.822,6362.93));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,1357.65,459.06));
         this.excluderMatrices.push(new Vector3D(-377.662,477.388,6217.18));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,954.776,754.649));
         this.excluderMatrices.push(new Vector3D(-619.136,548.086,5530.52));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(954.776,1096.17,623.682));
         this.excluderMatrices.push(new Vector3D(-490.861,683.851,4900.84));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(670.242,1367.7,452.548));
         this.excluderMatrices.push(new Vector3D(-1488.04,477.69,4868.55));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(670.242,955.38,457.933));
         this.excluderMatrices.push(new Vector3D(-1546.06,1226.91,5640.27));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(551.964,2453.82,984.645));
         this.excluderMatrices.push(new Vector3D(411.727,477.69,4961.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(458.968,955.38,670.242));
         this.excluderMatrices.push(new Vector3D(526.908,844.757,5538.4));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(710.933,1689.51,486.153));
         this.excluderMatrices.push(new Vector3D(1049.02,422.378,6179.96));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1769.97,844.757,774.361));
         this.excluderMatrices.push(new Vector3D(1708.05,1060.97,5563.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(452.756,2121.95,451.205));
         this.excluderMatrices.push(new Vector3D(1710.86,482.718,4986.58));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(455.9,965.436,697.457));
         this.excluderMatrices.push(new Vector3D(1072,952.889,4869.51));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(711.04,1905.78,489.893));
         this.excluderMatrices.push(new Vector3D(2723.68,1226.91,6250.95));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(955.38,2453.82,608.839));
         this.excluderMatrices.push(new Vector3D(3559.93,960.408,6316.65));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(743.893,1920.82,482.969));
         this.excluderMatrices.push(new Vector3D(3581.6,683.851,5712.84));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(670.375,1367.7,462.605));
         this.excluderMatrices.push(new Vector3D(2603,955.38,5678.06));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(714.021,1910.76,486.202));
         this.excluderMatrices.push(new Vector3D(3085.72,512.583,5009.29));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1655.62,1025.17,728.373));
         this.excluderMatrices.push(new Vector3D(5059.68,336.897,3370.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1659.34,673.794,1910.76));
         this.excluderMatrices.push(new Vector3D(3598.61,1342.37,3762.27));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(573.228,2684.74,1076.06));
         this.excluderMatrices.push(new Vector3D(968.116,653.681,2625.77));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(471.234,1307.36,422.378));
         this.excluderMatrices.push(new Vector3D(463.687,693.907,2881.79));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(553.115,1387.81,954.065));
         this.excluderMatrices.push(new Vector3D(425.579,487.747,3724.03));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,975.493,673.794));
         this.excluderMatrices.push(new Vector3D(820.342,487.747,4131.32));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(683.851,975.493,462.605));
         this.excluderMatrices.push(new Vector3D(1054.12,341.925,1119.7));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1739.8,683.851,1930.87));
         this.excluderMatrices.push(new Vector3D(-306.298,478.043,1792.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(457.933,956.087,670.375));
         this.excluderMatrices.push(new Vector3D(-947.15,688.879,1873.61));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(714.021,1377.76,472.662));
         this.excluderMatrices.push(new Vector3D(-989.847,427.407,538.641));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1780.02,854.814,770.877));
         this.excluderMatrices.push(new Vector3D(-322.637,522.667,1186.15));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(459.037,1045.33,515.328));
         this.excluderMatrices.push(new Vector3D(-1493.82,693.333,1189.57));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(704,1386.67,483.555));
         this.excluderMatrices.push(new Vector3D(-1596.33,480,1786.9));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(469.333,960,682.666));
         this.excluderMatrices.push(new Vector3D(-962.675,419.555,4034.15));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1813.51,839.111,774.4));
         this.excluderMatrices.push(new Vector3D(-961.418,405.333,2810.68));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1781.19,810.667,772.789));
         this.excluderMatrices.push(new Vector3D(-307.199,1056,3418.82));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(463.409,2112,423.516));
         this.excluderMatrices.push(new Vector3D(-1582.95,1068.73,3410.44));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.358,2137.46,417.615));
         this.excluderMatrices.push(new Vector3D(-2992.67,507.86,3961.89));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1659.34,1015.72,724.077));
         this.excluderMatrices.push(new Vector3D(-5016.35,331.869,3381.02));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1695.32,663.738,1919.52));
         this.excluderMatrices.push(new Vector3D(-3440.49,668.766,3259.7));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.298,1337.53,463.255));
         this.excluderMatrices.push(new Vector3D(-2474.07,950.351,3297.38));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(716.765,1900.7,487.752));
         this.excluderMatrices.push(new Vector3D(3077.23,512,1722.33));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1664,1024,739.555));
         this.excluderMatrices.push(new Vector3D(2590.47,960,421.636));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(710.899,1920,492.8));
         this.excluderMatrices.push(new Vector3D(2584.25,682.667,1030.28));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(668.948,1365.33,454.248));
         this.excluderMatrices.push(new Vector3D(3560.28,945.778,1035.66));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(717.59,1891.56,571.648));
         this.excluderMatrices.push(new Vector3D(3453.61,1223.11,458.702));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(952.889,2446.22,557.568));
         this.excluderMatrices.push(new Vector3D(5561.41,482.718,1861.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,965.436,472.662));
         this.excluderMatrices.push(new Vector3D(4565.81,678.822,1871.92));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,1357.65,472.662));
         this.excluderMatrices.push(new Vector3D(4711.63,558.143,1216.73));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(955.782,1116.29,605.125));
         this.excluderMatrices.push(new Vector3D(4470.27,487.746,548.148));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,975.493,741.173));
         this.excluderMatrices.push(new Vector3D(5616.6,950.351,1127.73));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(548.489,1900.7,955.38));
         this.excluderMatrices.push(new Vector3D(5676.62,1059.56,403.459));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(433.777,2119.11,426.667));
         this.excluderMatrices.push(new Vector3D(5101.77,679.111,395.476));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(717.489,1358.22,415.492));
         this.excluderMatrices.push(new Vector3D(5047.29,416,-517.429));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1664,832,789.333));
         this.excluderMatrices.push(new Vector3D(4506.84,788.48,-1598.32));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(554.667,1576.96,945.778));
         this.excluderMatrices.push(new Vector3D(5694.4,896,-1292.54));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.667,1792,433.778));
         this.excluderMatrices.push(new Vector3D(5004.62,878.222,-1850.76));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.667,1756.44,440.889));
         this.excluderMatrices.push(new Vector3D(5565.69,671.147,-1836.27));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(667.372,1342.29,462.222));
         this.excluderMatrices.push(new Vector3D(5061.51,423.111,-2750.32));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1649.78,846.222,718.222));
         this.excluderMatrices.push(new Vector3D(5527.29,977.778,-3365.43));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(704,1955.56,497.778));
         this.excluderMatrices.push(new Vector3D(5644.5,487.111,-3957.28));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(456.959,974.222,675.84));
         this.excluderMatrices.push(new Vector3D(5057.96,696.889,-4048.09));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(704,1393.78,483.556));
         this.excluderMatrices.push(new Vector3D(4453.79,483.555,-3942.29));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(434.381,967.111,716.089));
         this.excluderMatrices.push(new Vector3D(4457.07,519.111,-3346.75));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.667,1038.22,467.233));
         this.excluderMatrices.push(new Vector3D(3580.48,675.556,-3231.74));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(676.051,1351.11,560.788));
         this.excluderMatrices.push(new Vector3D(3091.74,508.444,-3937.87));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1649.78,1016.89,718.222));
         this.excluderMatrices.push(new Vector3D(2609.73,956.444,-3229.23));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(718.222,1912.89,536.747));
         this.excluderMatrices.push(new Vector3D(2721.96,881.778,-2661.43));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(952.889,1763.56,554.667));
         this.excluderMatrices.push(new Vector3D(3571.74,945.778,-2687.77));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(718.222,1891.56,546.418));
         this.excluderMatrices.push(new Vector3D(-5517.02,682.667,1869.04));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(675.84,1365.33,455.111));
         this.excluderMatrices.push(new Vector3D(-4495.32,476.444,1873.93));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(675.84,952.889,458.791));
         this.excluderMatrices.push(new Vector3D(-4464.67,1251.56,1145));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(554.667,2503.11,952.889));
         this.excluderMatrices.push(new Vector3D(-5386.5,547.556,1196.56));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(947.866,1095.11,629.727));
         this.excluderMatrices.push(new Vector3D(-4382.79,1080.89,383.594));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(420.734,2161.78,416.569));
         this.excluderMatrices.push(new Vector3D(-4984.18,682.667,414.019));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(674.046,1365.33,464.64));
         this.excluderMatrices.push(new Vector3D(-5623.62,483.555,512.409));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(454.249,967.111,668.444));
         this.excluderMatrices.push(new Vector3D(-5012.22,422.378,-509.852));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1706.67,844.757,746.24));
         this.excluderMatrices.push(new Vector3D(-4390.62,900.068,-1289.87));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,1800.14,425.056));
         this.excluderMatrices.push(new Vector3D(-5586.56,794.474,-1607.81));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(543.058,1588.95,946.224));
         this.excluderMatrices.push(new Vector3D(-4544.48,683.851,-1868.59));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(711.526,1367.7,416.93));
         this.excluderMatrices.push(new Vector3D(-5091.31,869.898,-1869.24));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(418.155,1739.8,420.61));
         this.excluderMatrices.push(new Vector3D(-2527.33,422.378,-836.356));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(768.807,844.757,1397.87));
         this.excluderMatrices.push(new Vector3D(-3268.99,472.662,-374));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,945.323,463.697));
         this.excluderMatrices.push(new Vector3D(-3597.95,487.747,-750.539));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(452.548,975.493,673.794));
         this.excluderMatrices.push(new Vector3D(-1614.67,900.068,-883.607));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(420.805,1800.14,428.068));
         this.excluderMatrices.push(new Vector3D(-1488.68,678.822,-373.866));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(666.82,1357.65,462.605));
         this.excluderMatrices.push(new Vector3D(-907.889,874.927,-345.887));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,1749.85,428.111));
         this.excluderMatrices.push(new Vector3D(-402.859,789.445,-607.814));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(543.058,1578.89,955.38));
         this.excluderMatrices.push(new Vector3D(-978.489,417.35,-1698.8));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1722.4,834.7,776.573));
         this.excluderMatrices.push(new Vector3D(-5011,417.35,-2764.56));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1659.34,834.7,768.807));
         this.excluderMatrices.push(new Vector3D(-4532.06,970.667,-3398.19));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(711.111,1941.33,483.555));
         this.excluderMatrices.push(new Vector3D(-5638.76,519.111,-3398.4));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.667,1038.22,419.555));
         this.excluderMatrices.push(new Vector3D(-5008.5,689.778,-4049.32));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(718.08,1379.56,485.76));
         this.excluderMatrices.push(new Vector3D(-5629.04,480,-3968.8));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(459.994,960,669.082));
         this.excluderMatrices.push(new Vector3D(-4412.79,480,-3959.01));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(457.005,960,668.444));
         this.excluderMatrices.push(new Vector3D(-5018.64,423.111,-4990.66));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1675.52,846.222,774.4));
         this.excluderMatrices.push(new Vector3D(-4382.72,1075.2,-5599.72));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(426.667,2150.4,427.794));
         this.excluderMatrices.push(new Vector3D(-5652.06,1079.75,-5589.44));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(419.555,2159.5,433.778));
         this.excluderMatrices.push(new Vector3D(-5015.61,423.111,-6207.28));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1706.67,846.222,789.333));
         this.excluderMatrices.push(new Vector3D(-2985.38,423.111,-6242.83));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1770.67,846.222,773.625));
         this.excluderMatrices.push(new Vector3D(-2456.5,678.822,-4843.78));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(666.82,1357.65,463.255));
         this.excluderMatrices.push(new Vector3D(-3039.95,1060.97,-4840.82));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(416.445,2121.95,426.602));
         this.excluderMatrices.push(new Vector3D(-3584.86,1226.91,-5097.55));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(548.488,2453.82,943.807));
         this.excluderMatrices.push(new Vector3D(-2323.62,1050.92,-5640.45));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(429.349,2101.84,432.435));
         this.excluderMatrices.push(new Vector3D(-967.981,362.039,-5610.16));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1749.85,724.077,1920.82));
         this.excluderMatrices.push(new Vector3D(-2998.84,417.35,-2776.89));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1726.38,834.7,761.79));
         this.excluderMatrices.push(new Vector3D(-2341.69,1086.12,-3399.12));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,2172.23,428.11));
         this.excluderMatrices.push(new Vector3D(-3651.48,1071.03,-3399.07));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(424.773,2142.06,414.454));
         this.excluderMatrices.push(new Vector3D(-2991.43,422.378,-3978.12));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1719.68,844.757,693.908));
         this.excluderMatrices.push(new Vector3D(-378.2,477.69,-2739.68));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,955.38,673.794));
         this.excluderMatrices.push(new Vector3D(-1061.42,683.851,-2605.08));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(750.82,1367.7,393.084));
         this.excluderMatrices.push(new Vector3D(-1631.07,1066,-2607.16));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,2132,422.378));
         this.excluderMatrices.push(new Vector3D(-1567.18,1236.96,-3364.3));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(546.445,2473.93,954.777));
         this.excluderMatrices.push(new Vector3D(-627.528,553.115,-3450.23));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(955.38,1106.23,629.947));
         this.excluderMatrices.push(new Vector3D(-466.183,683.851,-4075.63));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(663.738,1367.7,452.548));
         this.excluderMatrices.push(new Vector3D(-1508.3,487.747,-4090.68));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(677.012,975.493,463.938));
         this.excluderMatrices.push(new Vector3D(-3569.84,1224.07,-1599.47));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(545.849,2448.14,945.778));
         this.excluderMatrices.push(new Vector3D(-2448.65,476.444,-1836.06));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(668.444,952.889,448));
         this.excluderMatrices.push(new Vector3D(-3047.43,696.889,-1852.89));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(419.555,1393.78,433.778));
         this.excluderMatrices.push(new Vector3D(541.326,497.803,-375.066));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,995.606,462.605));
         this.excluderMatrices.push(new Vector3D(488.427,714.021,-1151.65));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(548.489,1428.04,953.245));
         this.excluderMatrices.push(new Vector3D(420.677,1076.66,-1872.22));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(425.056,2153.32,428.068));
         this.excluderMatrices.push(new Vector3D(1061.79,422.378,-2763.02));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1777.51,844.757,776.573));
         this.excluderMatrices.push(new Vector3D(1709.93,477.69,-3964.28));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,955.38,673.298));
         this.excluderMatrices.push(new Vector3D(1093.54,960.408,-4063.78));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(707.855,1920.82,482.718));
         this.excluderMatrices.push(new Vector3D(416.226,477.69,-3987.21));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(457.979,955.38,669.463));
         this.excluderMatrices.push(new Vector3D(1729.53,869.898,-3377.47));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,1739.8,464.616));
         this.excluderMatrices.push(new Vector3D(548.716,844.757,-3405.8));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(714.934,1689.51,487.799));
         this.excluderMatrices.push(new Vector3D(1668.49,1236.96,-5114.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(553.918,2473.93,956.081));
         this.excluderMatrices.push(new Vector3D(572.763,417.35,-5883.34));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(768.807,834.7,1391.54));
         this.excluderMatrices.push(new Vector3D(1713.96,492.775,-5981.29));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(462.605,985.55,663.737));
         this.excluderMatrices.push(new Vector3D(1379.73,477.69,-6353.31));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(673.794,955.38,452.548));
         this.excluderMatrices.push(new Vector3D(527.276,482.718,-4844.9));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(683.851,965.436,462.605));
         this.excluderMatrices.push(new Vector3D(1130.67,1066,-4839.87));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(422.378,2132,432.436));
         this.excluderMatrices.push(new Vector3D(3622.18,1215.77,-821.024));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(325.207,2431.54,314.998));
         this.excluderMatrices.push(new Vector3D(3603.23,2781.19,3755.86));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(363.833,216.605,839.806));
         this.excluderMatrices.push(new Vector3D(-1718.9,884.393,2499.51));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(58.915,107.814,49.613));
         this.excluderMatrices.push(new Vector3D(-1802.53,865.69,231.134));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(54.814,44.407,56.276));
         this.excluderMatrices.push(new Vector3D(-196.937,847.528,-1418.24));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(89.628,38.79,123.422));
         this.excluderMatrices.push(new Vector3D(-283.333,886.975,-1382.74));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(60.007,109.387,47.517));
         this.excluderMatrices.push(new Vector3D(260.904,1449.36,-723.403));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(57.007,58.469,59.2));
         this.excluderMatrices.push(new Vector3D(712.78,1449.36,-1583.4));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(57.007,58.469,59.2));
         this.excluderMatrices.push(new Vector3D(-2196.66,891.838,-1469.37));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(59.93,99.214,44.582));
         this.excluderMatrices.push(new Vector3D(-2831.93,891.838,-207.224));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(59.93,99.214,44.582));
         this.excluderMatrices.push(new Vector3D(-174.63,865.69,805.548));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(54.814,44.407,56.276));
         this.excluderMatrices.push(new Vector3D(1792.64,645.83,1918));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(89.165,108.167,121.323));
         this.excluderMatrices.push(new Vector3D(336.049,645.83,335.49));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(89.165,108.167,121.323));
         this.excluderMatrices.push(new Vector3D(2344.35,1031.2,5257.09));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(90.627,39.73,137.401));
         this.excluderMatrices.push(new Vector3D(3833,1031.2,4747.9));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(90.627,39.73,137.401));
         this.excluderMatrices.push(new Vector3D(-271.512,2149.1,3582.88));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(115.476,73.671,80.395));
         this.excluderMatrices.push(new Vector3D(2545.36,1071.53,1890.94));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(62.015,101.292,43.411));
         this.excluderMatrices.push(new Vector3D(269.628,982.415,3992.91));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(57.881,163.307,48.579));
         this.excluderMatrices.push(new Vector3D(-142.774,828.959,4340.2));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(109.561,151.938,75.452));
         this.excluderMatrices.push(new Vector3D(3621.96,2657.99,-1015.25));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(39.225,447.462,39.793));
         this.excluderMatrices.push(new Vector3D(3607.6,1215.77,-1582.32));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(325.207,2431.54,314.998));
         this.excluderMatrices.push(new Vector3D(3612.95,808.372,-1191.37));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(332.816,1616.74,682.171));
         this.excluderMatrices.push(new Vector3D(3612.95,1695.96,-1191.37));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(239.628,177.842,682.171));
         this.excluderMatrices.push(new Vector3D(3612.95,1839.66,-1191.37));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(167.739,124.489,682.171));
         this.excluderMatrices.push(new Vector3D(3612.95,2116.43,-1191.37));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(103.998,420.774,682.171));
         this.excluderMatrices.push(new Vector3D(3605.4,2657.99,-1384.94));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(39.225,447.462,39.793));
         this.excluderMatrices.push(new Vector3D(3623.9,2456.56,-952.656));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(130.737,62.645,129.147));
         this.excluderMatrices.push(new Vector3D(3603.43,2456.56,-1448.97));
         this.excluderMatrices.push(new Vector3D(0,45,0));
         this.excluderMatrices.push(new Vector3D(130.737,62.645,129.147));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-15,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-45,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-75,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-105,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-135,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3318.16,1284.33,-5748.87));
         this.excluderMatrices.push(new Vector3D(0,-165,0));
         this.excluderMatrices.push(new Vector3D(160.082,2568.66,691.266));
         this.excluderMatrices.push(new Vector3D(3390.36,1284.33,-5408.67));
         this.excluderMatrices.push(new Vector3D(0,-145,0));
         this.excluderMatrices.push(new Vector3D(184.095,2568.66,117.515));
         this.excluderMatrices.push(new Vector3D(-3538.77,951.041,-232.413));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(84.78,59.989,124.246));
         this.excluderMatrices.push(new Vector3D(-3000.87,100.961,1107.41));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-3624.95,100.961,1019.48));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-3213.73,100.961,691.685));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-3578.95,100.961,453.437));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-2856.41,100.961,560.43));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-2619.62,100.961,958.181));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-2361.07,100.961,526.679));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(3083.76,100.961,-526.133));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(2513.48,100.961,-574.744));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(2754.94,100.961,-942.116));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(3170.21,100.961,-1148.72));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(2474.3,100.961,-1182.6));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(2588.67,100.961,-1788.14));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(2714.66,100.961,-1458.95));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(3021.82,100.961,-1535.04));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(3119.76,100.961,-1887.31));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(15.194,201.922,10.791));
         this.excluderMatrices.push(new Vector3D(-2956.44,279.07,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(524.837,558.139,519.194));
         this.excluderMatrices.push(new Vector3D(-2956.44,830.888,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(425.118,558.139,410.163));
         this.excluderMatrices.push(new Vector3D(-2956.44,1390.47,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(340.094,558.139,352.74));
         this.excluderMatrices.push(new Vector3D(-2956.44,1942.29,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(255.071,558.139,261.028));
         this.excluderMatrices.push(new Vector3D(-2956.44,2479.87,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(153.043,535.814,172.278));
         this.excluderMatrices.push(new Vector3D(-3087.22,1877.7,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,5));
         this.excluderMatrices.push(new Vector3D(153.043,535.814,91.308));
         this.excluderMatrices.push(new Vector3D(-2827.16,1877.7,1628.1));
         this.excluderMatrices.push(new Vector3D(0,0,-5));
         this.excluderMatrices.push(new Vector3D(153.043,535.814,91.308));
         this.excluderMatrices.push(new Vector3D(-5016.35,331.869,5565.47));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1695.32,663.738,1919.52));
         this.excluderMatrices.push(new Vector3D(5055.39,331.869,5565.47));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1695.32,663.738,1919.52));
         this.excluderMatrices.push(new Vector3D(5055.39,331.869,-5618.35));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(1695.32,663.738,1919.52));
         this.coreInterface.generateBoxes(this.excluderMatrices);
      }
      
      private function createGoldenGate() : void
      {
         this.addMeshToLevel(new golden_gate(),true);
         this.addMeshToLevel(new golden_gate_otherside(),true);
         this.addMeshToLevel(new golden_gate_ground(),true);
         this.addMeshToLevel(new golden_gate_sky(),true);
         this.addMeshToLevel(new golden_gate_water(),true);
         this.addMeshToLevel(new golden_gate_clouds(),true);
         this.addMeshToLevel(new golden_gate_tree(),true);
         this.excluderMatrices.push(new Vector3D(-4279.28,857.757,-17.814));
         this.excluderMatrices.push(new Vector3D(0,0,0.827));
         this.excluderMatrices.push(new Vector3D(4202.44,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(-68.775,928.283,-17.814));
         this.excluderMatrices.push(new Vector3D(0,0,0.827));
         this.excluderMatrices.push(new Vector3D(4202.44,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(2916.48,963.415,-17.814));
         this.excluderMatrices.push(new Vector3D(0,0,0.827));
         this.excluderMatrices.push(new Vector3D(1776.5,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(4687.6,963.93,-17.814));
         this.excluderMatrices.push(new Vector3D(0,0,-0.827));
         this.excluderMatrices.push(new Vector3D(1776.5,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(7677.6,926.525,-17.814));
         this.excluderMatrices.push(new Vector3D(0,0,-0.827));
         this.excluderMatrices.push(new Vector3D(4202.44,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(11882.2,860.339,-17.813));
         this.excluderMatrices.push(new Vector3D(0,0,-0.827));
         this.excluderMatrices.push(new Vector3D(4202.44,88.376,287.406));
         this.excluderMatrices.push(new Vector3D(-3401.9,1260.55,160.059));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(145.419,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(-3401.9,1260.55,137.44));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(106.156,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(-3401.9,1260.55,-174.041));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(106.156,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(-3401.9,1260.55,-195.366));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(145.419,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(-3401.75,2348.19,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(-3401.75,1965.88,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(-3401.75,1601.81,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(-3401.75,1241.75,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,148.936,264.88));
         this.excluderMatrices.push(new Vector3D(-3401.41,644.351,-26.845));
         this.excluderMatrices.push(new Vector3D(90,-90,-45.809));
         this.excluderMatrices.push(new Vector3D(484.56,36.025,63.672));
         this.excluderMatrices.push(new Vector3D(-3401.41,644.351,-26.845));
         this.excluderMatrices.push(new Vector3D(90,-90,48.568));
         this.excluderMatrices.push(new Vector3D(484.56,36.025,63.672));
         this.excluderMatrices.push(new Vector3D(-3401.2,441.316,-26.845));
         this.excluderMatrices.push(new Vector3D(0,90,0));
         this.excluderMatrices.push(new Vector3D(324.655,36.025,38.33));
         this.excluderMatrices.push(new Vector3D(-3414.5,18.433,-26.383));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(351.958,114.559,752.224));
         this.excluderMatrices.push(new Vector3D(10985.9,2348.19,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(10986.4,441.316,-26.846));
         this.excluderMatrices.push(new Vector3D(0,90,0));
         this.excluderMatrices.push(new Vector3D(324.655,36.025,38.33));
         this.excluderMatrices.push(new Vector3D(10985.7,1260.55,160.059));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(145.419,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(10985.7,1260.55,137.44));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(106.156,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(10985.7,1260.55,-174.041));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(106.156,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(10985.7,1260.55,-195.366));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(145.419,2379.75,51.726));
         this.excluderMatrices.push(new Vector3D(10995.3,18.433,-26.383));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(351.958,114.559,752.224));
         this.excluderMatrices.push(new Vector3D(10985.9,1965.88,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(10985.9,1601.81,-18.633));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,165.484,264.88));
         this.excluderMatrices.push(new Vector3D(10985.9,1241.75,-18.634));
         this.excluderMatrices.push(new Vector3D(0,0,0));
         this.excluderMatrices.push(new Vector3D(55.919,148.936,264.88));
         this.excluderMatrices.push(new Vector3D(10986.2,644.351,-26.846));
         this.excluderMatrices.push(new Vector3D(90,-90,-45.809));
         this.excluderMatrices.push(new Vector3D(484.56,36.025,63.672));
         this.excluderMatrices.push(new Vector3D(10986.2,644.351,-26.846));
         this.excluderMatrices.push(new Vector3D(90,-90,48.568));
         this.excluderMatrices.push(new Vector3D(484.56,36.025,63.672));
         this.excluderMatrices.push(new Vector3D(-8424.25,303.678,230.903));
         this.excluderMatrices.push(new Vector3D(0,-9.999,0));
         this.excluderMatrices.push(new Vector3D(4085.47,1170.43,1609.9));
         this.excluderMatrices.push(new Vector3D(-13565.3,367.408,1442.93));
         this.excluderMatrices.push(new Vector3D(0,-7.192,0));
         this.excluderMatrices.push(new Vector3D(6050.92,1179.8,5432.58));
         this.excluderMatrices.push(new Vector3D(-10034.4,336.487,3346.02));
         this.excluderMatrices.push(new Vector3D(0,-20.98,0));
         this.excluderMatrices.push(new Vector3D(2247.01,1170.43,2981.29));
         this.excluderMatrices.push(new Vector3D(-12910.2,316.884,6301.47));
         this.excluderMatrices.push(new Vector3D(0,-57.864,0));
         this.excluderMatrices.push(new Vector3D(3685.1,1170.43,4740.25));
         this.excluderMatrices.push(new Vector3D(-10914.4,321.136,5319.35));
         this.excluderMatrices.push(new Vector3D(0,-21.559,0));
         this.excluderMatrices.push(new Vector3D(2542.72,1170.43,1990.91));
         this.excluderMatrices.push(new Vector3D(-14594.1,322.925,4311.27));
         this.excluderMatrices.push(new Vector3D(0,15.017,0));
         this.excluderMatrices.push(new Vector3D(3685.1,1170.43,3125.72));
         this.excluderMatrices.push(new Vector3D(-7830.13,312.913,1578.08));
         this.excluderMatrices.push(new Vector3D(0,-59.652,0));
         this.excluderMatrices.push(new Vector3D(962.538,1170.43,2430.95));
         this.excluderMatrices.push(new Vector3D(-9389.87,316.507,1271.42));
         this.excluderMatrices.push(new Vector3D(0,-10.375,0));
         this.excluderMatrices.push(new Vector3D(2906.86,1170.43,1592.03));
         this.excluderMatrices.push(new Vector3D(-12976.2,515.599,-1639.96));
         this.excluderMatrices.push(new Vector3D(-48.028,-9.133,0));
         this.excluderMatrices.push(new Vector3D(5918.27,93.693,1405.4));
         this.excluderMatrices.push(new Vector3D(-8359.68,398.853,-894.068));
         this.excluderMatrices.push(new Vector3D(-57.886,-11.459,0));
         this.excluderMatrices.push(new Vector3D(3470.83,93.693,1096.21));
         this.excluderMatrices.push(new Vector3D(-8994.71,417.746,4614.79));
         this.excluderMatrices.push(new Vector3D(-56.266,-110.826,0));
         this.excluderMatrices.push(new Vector3D(4998,93.693,1152.42));
         this.excluderMatrices.push(new Vector3D(-11989.9,423.261,8349.55));
         this.excluderMatrices.push(new Vector3D(-47.695,-146.918,0));
         this.excluderMatrices.push(new Vector3D(4998,93.693,1152.42));
         this.excluderMatrices.push(new Vector3D(-7393.94,421.518,2239.73));
         this.excluderMatrices.push(new Vector3D(-50.516,-151.353,0));
         this.excluderMatrices.push(new Vector3D(2415.03,93.693,1152.42));
         this.excluderMatrices.push(new Vector3D(-6187.2,363.512,669.252));
         this.excluderMatrices.push(new Vector3D(-60.304,-90.495,0));
         this.excluderMatrices.push(new Vector3D(1835.42,93.693,1152.42));
         this.excluderMatrices.push(new Vector3D(-6416.37,356.682,-322.268));
         this.excluderMatrices.push(new Vector3D(-60.304,-37.979,0));
         this.excluderMatrices.push(new Vector3D(660.753,93.693,1152.42));
         this.excluderMatrices.push(new Vector3D(-5687.61,1014.27,131.485));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(-4907.48,1182.71,131.485));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,593.306));
         this.excluderMatrices.push(new Vector3D(-4087.7,1407.39,131.138));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1007.37));
         this.excluderMatrices.push(new Vector3D(-2709.1,1540.73,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1295.02));
         this.excluderMatrices.push(new Vector3D(-1840.56,1389.67,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,895.504));
         this.excluderMatrices.push(new Vector3D(-985.848,1296.35,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,715.294));
         this.excluderMatrices.push(new Vector3D(-132.03,1217.52,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,521.222));
         this.excluderMatrices.push(new Vector3D(722.25,1157.98,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,365.964));
         this.excluderMatrices.push(new Vector3D(1577.16,1104.52,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(2430.92,1070.49,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,166.347));
         this.excluderMatrices.push(new Vector3D(3284.95,1073.86,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,158.03));
         this.excluderMatrices.push(new Vector3D(4298.18,1073.84,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,146.94));
         this.excluderMatrices.push(new Vector3D(5153.03,1071.33,134.051));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,191.3));
         this.excluderMatrices.push(new Vector3D(6007.63,1111.61,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(6860.94,1162.56,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,360.419));
         this.excluderMatrices.push(new Vector3D(7715.82,1220.61,134.051));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,518.449));
         this.excluderMatrices.push(new Vector3D(8568.78,1294.16,134.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,701.432));
         this.excluderMatrices.push(new Vector3D(9423.49,1388.66,134.049));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,895.504));
         this.excluderMatrices.push(new Vector3D(10291.9,1533.9,134.051));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1260.86));
         this.excluderMatrices.push(new Vector3D(11672.7,1388.85,140.351));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1013.75));
         this.excluderMatrices.push(new Vector3D(12490.3,1175.58,140.351));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,598.851));
         this.excluderMatrices.push(new Vector3D(13273.4,1014.27,140.352));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(13273.4,1014.27,-172.891));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(12490.3,1175.58,-173.035));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,598.851));
         this.excluderMatrices.push(new Vector3D(11672.7,1388.85,-173.023));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1013.75));
         this.excluderMatrices.push(new Vector3D(10291.9,1533.9,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1260.86));
         this.excluderMatrices.push(new Vector3D(9423.49,1388.66,-168.468));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,895.504));
         this.excluderMatrices.push(new Vector3D(8568.78,1294.16,-168.468));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,701.432));
         this.excluderMatrices.push(new Vector3D(7715.82,1220.61,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,518.449));
         this.excluderMatrices.push(new Vector3D(6860.94,1162.56,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,360.419));
         this.excluderMatrices.push(new Vector3D(6007.63,1111.61,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(5153.02,1071.33,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,191.3));
         this.excluderMatrices.push(new Vector3D(4298.18,1073.84,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,146.94));
         this.excluderMatrices.push(new Vector3D(-2709.1,1540.73,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1295.02));
         this.excluderMatrices.push(new Vector3D(-1840.56,1389.67,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,895.504));
         this.excluderMatrices.push(new Vector3D(-985.848,1296.35,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,715.294));
         this.excluderMatrices.push(new Vector3D(-132.03,1217.52,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,521.222));
         this.excluderMatrices.push(new Vector3D(722.25,1157.98,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,365.964));
         this.excluderMatrices.push(new Vector3D(1577.16,1104.52,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(2430.92,1070.49,-168.468));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,166.347));
         this.excluderMatrices.push(new Vector3D(3284.95,1073.86,-168.467));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,158.03));
         this.excluderMatrices.push(new Vector3D(-5687.61,1014.27,-165.221));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,277.246));
         this.excluderMatrices.push(new Vector3D(-4087.7,1407.39,-165.53));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,1007.37));
         this.excluderMatrices.push(new Vector3D(-5639.47,1175.73,125.514));
         this.excluderMatrices.push(new Vector3D(90,0,22.447));
         this.excluderMatrices.push(new Vector3D(1593.27,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-4491.32,1695.73,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,27.479));
         this.excluderMatrices.push(new Vector3D(940.03,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-3760.5,2157.15,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,37.492));
         this.excluderMatrices.push(new Vector3D(855.428,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-3052.86,2306.2,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-20.859));
         this.excluderMatrices.push(new Vector3D(727.113,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-2316.72,2014.37,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-21.426));
         this.excluderMatrices.push(new Vector3D(844.542,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-1209.81,1698.19,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-12.881));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(232.344,1420.26,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-8.693));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(1689.19,1232.97,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-6.185));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(3112.53,1144.63,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-0.855));
         this.excluderMatrices.push(new Vector3D(1377.53,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(4472.22,1145.07,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,0.761));
         this.excluderMatrices.push(new Vector3D(1377.53,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(5879.16,1228.01,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,5.314));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(7342.3,1411.43,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,8.77));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(8783.43,1692.51,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,12.599));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(10200.1,2133.99,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,21.481));
         this.excluderMatrices.push(new Vector3D(1594.12,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(11354,2155.82,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-38.439));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(12092,1682.93,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-26.444));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(12902.3,1305.82,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-22.596));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(13727,962.314,125.515));
         this.excluderMatrices.push(new Vector3D(90,0,-22.596));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-4907.48,1182.71,-164.05));
         this.excluderMatrices.push(new Vector3D(90,0,0));
         this.excluderMatrices.push(new Vector3D(19.993,2.37,593.306));
         this.excluderMatrices.push(new Vector3D(-5639.47,1175.73,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,22.447));
         this.excluderMatrices.push(new Vector3D(1593.27,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-4491.32,1695.73,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,27.479));
         this.excluderMatrices.push(new Vector3D(940.03,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-3760.5,2157.15,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,37.492));
         this.excluderMatrices.push(new Vector3D(855.428,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-3052.86,2306.2,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,-20.859));
         this.excluderMatrices.push(new Vector3D(727.113,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-2316.72,2014.37,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-21.426));
         this.excluderMatrices.push(new Vector3D(844.542,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(-1209.81,1698.19,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-12.881));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(232.344,1420.26,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-8.693));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(1689.19,1232.97,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-6.185));
         this.excluderMatrices.push(new Vector3D(1466.55,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(3112.53,1144.63,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-0.855));
         this.excluderMatrices.push(new Vector3D(1377.53,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(4472.22,1145.07,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,0.761));
         this.excluderMatrices.push(new Vector3D(1377.53,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(5879.17,1228.01,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,5.314));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(7342.3,1411.43,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,8.77));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(8783.43,1692.51,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,12.599));
         this.excluderMatrices.push(new Vector3D(1476.04,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(10200.1,2133.99,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,21.481));
         this.excluderMatrices.push(new Vector3D(1594.12,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(11354,2155.82,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,-38.439));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(12092,1682.93,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,-26.444));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(12902.3,1305.82,-161.582));
         this.excluderMatrices.push(new Vector3D(90,0,-22.596));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.excluderMatrices.push(new Vector3D(13727,962.314,-161.581));
         this.excluderMatrices.push(new Vector3D(90,0,-22.596));
         this.excluderMatrices.push(new Vector3D(892.709,6.032,33.512));
         this.coreInterface.generateBoxes(this.excluderMatrices);
      }
      
      private function createLevel(level:int) : void
      {
         if(level == 0)
         {
            this.createAlcatraz();
            this.excluderMatrices.push(new Vector3D(-5038.64,2027.74,-1073.24));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-2135.1,1917.47,-923.451));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(1360.05,2336.97,-1078.66));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-9404.31,2027.74,-1073.71),90);
         }
         else if(level == 1)
         {
            this.createAlcatraz();
            this.excluderMatrices.push(new Vector3D(4379.77,1974.04,-2779.65));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(3738.19,1455.24,433.1));
            this.excluderMatrices.push(new Vector3D(0,-30,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(83.672,945.157,1692.36));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(4382.13,1974.04,-6600.57),0);
         }
         else if(level == 2)
         {
            this.createAlcatraz();
            this.excluderMatrices.push(new Vector3D(-3085.99,1423.76,1375.02));
            this.excluderMatrices.push(new Vector3D(0,-40,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-1844.89,1446.56,-1157.25));
            this.excluderMatrices.push(new Vector3D(0,-35,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(1764.69,1154.43,-2360.04));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(5444.43,1599.54,-639.851));
            this.excluderMatrices.push(new Vector3D(0,-120,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-5411.46,1429.84,4145.49),-40 + 180);
         }
         else if(level == 3)
         {
            this.createAlcatraz();
            this.excluderMatrices.push(new Vector3D(2085.77,1468.75,2238.15));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(791.161,1617.69,-128.086));
            this.excluderMatrices.push(new Vector3D(0,40,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-1747.91,2048.23,-1361.01));
            this.excluderMatrices.push(new Vector3D(0,60,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-2973.03,1905.76,-3383.88));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(2085.77,1468.75,5491.29),180);
         }
         else if(level == 4)
         {
            this.createSanFrancisco();
            this.excluderMatrices.push(new Vector3D(-366.275,1763.78,-300.702));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(1711.61,883.746,1570.33));
            this.excluderMatrices.push(new Vector3D(0,30,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(724.063,1262.13,4369.62));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-2268.9,900.897,4481.04));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-366.275,1763.78,-3415.28),0);
         }
         else if(level == 5)
         {
            this.createSanFrancisco();
            this.excluderMatrices.push(new Vector3D(-345.468,1693.42,-4230.64));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(1993.51,1618.07,-4459.19));
            this.excluderMatrices.push(new Vector3D(0,55,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(4170.57,1534.93,-3022.32));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(4071.16,1064.8,-126.122));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(4090.68,2015.44,3377.73));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-3722.29,1693.42,-4230.64),90);
         }
         else if(level == 6)
         {
            this.createSanFrancisco();
            this.excluderMatrices.push(new Vector3D(69.333,1624.13,2807.26));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-401.455,1404.1,1550.41));
            this.excluderMatrices.push(new Vector3D(0,35,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-2406.45,1543.54,826.892));
            this.excluderMatrices.push(new Vector3D(0,60,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-3949.53,899.921,-239.454));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-3845.65,1001.97,-2495.89));
            this.excluderMatrices.push(new Vector3D(0,-35,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.excluderMatrices.push(new Vector3D(-2305.86,1526.69,-4175.54));
            this.excluderMatrices.push(new Vector3D(0,-45,0));
            this.excluderMatrices.push(new Vector3D(200,200,50));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(69.333,1624.13,5652.39),180);
         }
         else if(level == 7)
         {
            this.createGoldenGate();
            this.excluderMatrices.push(new Vector3D(-6115.51,2027.74,-16.052));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3224.1,1104.62,-16.052));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-1321.05,1149.77,139.11));
            this.excluderMatrices.push(new Vector3D(0,-125,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(729.259,512.895,778.55));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-9842.06,2027.74,-16.052),-90 + 180);
         }
         else if(level == 8)
         {
            this.createGoldenGate();
            this.excluderMatrices.push(new Vector3D(-7572.25,2027.74,2812.37));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-4241.62,433.633,911.18));
            this.excluderMatrices.push(new Vector3D(0,-20,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3338.97,433.633,-725.542));
            this.excluderMatrices.push(new Vector3D(0,-85,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(21.171,598.932,1277.93));
            this.excluderMatrices.push(new Vector3D(0,-180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(616.329,922.002,3247.04));
            this.excluderMatrices.push(new Vector3D(0,-180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-492.521,1260.18,5444.18));
            this.excluderMatrices.push(new Vector3D(0,-180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-10346.1,2027.74,2812.37),-90 + 180);
         }
         else if(level == 9)
         {
            this.createGoldenGate();
            this.excluderMatrices.push(new Vector3D(-4967.56,543.271,2233.9));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-5229.19,1093.03,-233.46));
            this.excluderMatrices.push(new Vector3D(0,135,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3393.5,1153.7,-521.122));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-1718.06,1135.85,-18.383));
            this.excluderMatrices.push(new Vector3D(0,70,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-67.45,647.242,634.729));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(1754.68,831.265,-404.151));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(3797.18,1220.45,-500.968));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-4967.56,543.271,5458.43),180);
         }
         else if(level == 10)
         {
            this.createGoldenGate();
            this.excluderMatrices.push(new Vector3D(-66.975,155.102,766.672));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-2351.24,130.649,-2801.82));
            this.excluderMatrices.push(new Vector3D(0,-130,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-4304.03,541.08,-3575.66));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-5826.56,468.69,-2823.35));
            this.excluderMatrices.push(new Vector3D(0,-30,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-5937.62,202.304,-1131));
            this.excluderMatrices.push(new Vector3D(0,40,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-4709.62,202.304,141.966));
            this.excluderMatrices.push(new Vector3D(0,80,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3092.31,202.304,-23.107));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-66.975,155.102,5726.31),180);
         }
         else if(level == 11)
         {
            this.createGoldenGate();
            this.excluderMatrices.push(new Vector3D(-8833.08,1414.03,3258.26));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-7320.94,1234.86,774.421));
            this.excluderMatrices.push(new Vector3D(0,140,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-5281.26,1414.03,-27.09));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3225.55,1405.79,-27.09));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-1579.32,2175.96,-27.09));
            this.excluderMatrices.push(new Vector3D(-45,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(634.171,2472.73,252.964));
            this.excluderMatrices.push(new Vector3D(0,90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(2657.98,1375.43,2737.76));
            this.excluderMatrices.push(new Vector3D(0,0,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(341.882,1079.44,4948.82));
            this.excluderMatrices.push(new Vector3D(0,-90,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-3973.95,643.992,2159.33));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-4318.86,659.987,-1116.21));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.excluderMatrices.push(new Vector3D(-4318.86,841.962,-3151.86));
            this.excluderMatrices.push(new Vector3D(0,180,0));
            this.excluderMatrices.push(new Vector3D(250,250,70));
            this.createRings(this.excluderMatrices);
            this._player.add(new Vector3D(-8833.08,1414.03,6755.62),180);
         }
         this.level_time = 0;
         addChild(gfxArrow);
         gfxArrow.alpha = 0;
         this.addMeshToLevel(this.ringIndicator,true);
         addChild(gfxHud);
         this._levelSuccess = true;
         addChild(gfxCount);
         gfxCount.gotoAndPlay(0);
         this.startLampActive = true;
         this.last_time = new Date().getTime();
         this.coreInterface.physics.engine.setGravity(new Vector3D(0,0,0));
      }
      
      private function createRings(vec:Vector.<Vector3D>) : void
      {
         var m:Mesh = null;
         var _excluderMatrices:Vector.<Vector3D> = new Vector.<Vector3D>();
         for(var _i:int = 0; _i < vec.length; _i += 3)
         {
            m = new ring();
            this.addMeshToLevel(m,this.coreInterface.bspSort);
            m.x = vec[_i].x;
            m.y = vec[_i].y;
            m.z = vec[_i].z;
            m.rotationX = vec[_i + 1].x * (Math.PI / 180);
            m.rotationY = vec[_i + 1].y * (Math.PI / 180);
            m.rotationZ = vec[_i + 1].z * (Math.PI / 180);
            this.checkPoints.push(m.matrix);
            _excluderMatrices.push(new Vector3D(95.025,95.025,0));
            _excluderMatrices.push(new Vector3D(90,0,-45));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(134.385,0,0));
            _excluderMatrices.push(new Vector3D(90,0,-90));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(95.025,-95.025,0));
            _excluderMatrices.push(new Vector3D(-90,180,45));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(0,-134.385,0));
            _excluderMatrices.push(new Vector3D(-90,180,0));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(-95.025,-95.025,0));
            _excluderMatrices.push(new Vector3D(-90,180,-45));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(-134.385,0,0));
            _excluderMatrices.push(new Vector3D(90,0,90));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(-95.025,95.025,0));
            _excluderMatrices.push(new Vector3D(90,0,45));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            _excluderMatrices.push(new Vector3D(0,134.385,0));
            _excluderMatrices.push(new Vector3D(90,0,0));
            _excluderMatrices.push(new Vector3D(106.543,46,32));
            this.coreInterface.generateBoxes(_excluderMatrices,m.matrix);
         }
         this.coreInterface.clearVector(vec);
      }
      
      private function addMeshToLevel(mesh:Mesh, bsp:Boolean) : void
      {
         if(bsp)
         {
            mesh.sorting = Sorting.DYNAMIC_BSP;
            mesh.optimizeForDynamicBSP();
         }
         this.coreInterface.sceneRoot.addChild(mesh);
         this.models.push(mesh);
      }
      
      private function keyDownHandler(event:KeyboardEvent) : void
      {
         if(this.gameState == core_gamestate.INGAME)
         {
            if(!this.mouseControl)
            {
               this._player.keyDownHandler(event);
            }
            if(event.keyCode == Keyboard.ESCAPE)
            {
               this.stopGame(true);
            }
            else if(event.keyCode == 80)
            {
               this.togglePause();
            }
            else if(this.fCheat && event.keyCode == 78)
            {
               this.triggerEnd();
            }
         }
         else if(this.gameState == core_gamestate.FRONTEND)
         {
            if(this.fCheat && event.keyCode == Keyboard.F1)
            {
               this.levelNum = 0;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F2)
            {
               this.levelNum = 1;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F3)
            {
               this.levelNum = 2;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F4)
            {
               this.levelNum = 3;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F5)
            {
               this.levelNum = 4;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F6)
            {
               this.levelNum = 5;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F7)
            {
               this.levelNum = 6;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F8)
            {
               this.levelNum = 7;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F9)
            {
               this.levelNum = 8;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F10)
            {
               this.levelNum = 9;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F11)
            {
               this.levelNum = 10;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
            else if(this.fCheat && event.keyCode == Keyboard.F12)
            {
               this.levelNum = 11;
               this.processFrontend(false);
               this.removeModels();
               this.startGame();
            }
         }
      }
      
      private function keyUpHandler(event:KeyboardEvent) : void
      {
         if(this.gameState == core_gamestate.INGAME)
         {
            if(!this.mouseControl)
            {
               this._player.keyUpHandler(event);
            }
         }
      }
      
      protected function onMouseUpDown(e:MouseEvent) : void
      {
         if(this.gameState == core_gamestate.INGAME && !this.coreInterface.paused)
         {
            this._player.onMouseUpDown(e);
         }
      }
      
      protected function onMouseMove(e:MouseEvent) : void
      {
         if(this.gameState == core_gamestate.INGAME && !this.coreInterface.paused)
         {
            if(this.mouseControl)
            {
               this._player.onMouseMove(e);
            }
         }
      }
      
      private function onResize(e:Event = null) : void
      {
         this.coreInterface.camera.view.width = stage.stageWidth;
         this.coreInterface.camera.view.height = stage.stageHeight;
      }
      
      private function triggerEnd() : void
      {
         this.gameState = core_gamestate.ENDGAME;
         if(this.levelNum == 11)
         {
            this.processWin(true);
         }
         else
         {
            this.processStatScreen(true);
         }
         this._player.resetControl();
         this.ringIndicator.alpha = 0;
         gfxArrow.alpha = 0;
      }
      
      private function triggerFail(snd:Boolean = true) : void
      {
         this.gameState = core_gamestate.ENDGAME;
         this._levelSuccess = false;
         this.processStatScreen(true);
         gfxArrow.alpha = 0;
         --this.lives;
         if(this.coreInterface.soundEnabled && snd)
         {
            this.sndFail.playLoadedSound();
         }
      }
      
      private function prepareFadeToBlack() : void
      {
         addChild(gfxFader);
         gfxFader.alpha = 0;
      }
      
      private function prepareFadeFromBlack() : void
      {
         addChild(gfxFader);
         gfxFader.alpha = 1;
      }
      
      protected function startGame() : void
      {
         this.coreInterface.paused = false;
         this.createLevel(this.levelNum);
         this.coreInterface.physics.engine.integrate(0.12);
         this.updateCamera(1);
         stage.focus = this;
         this.coreInterface.masterVolume = 1;
         this._frameCounter = 0;
         this.prepareFadeFromBlack();
         this.gameState = core_gamestate.GAMEFADEIN;
      }
      
      protected function stopGame(aborted:Boolean) : void
      {
         if(this.startLampActive)
         {
            removeChild(gfxCount);
         }
         removeChild(gfxHud);
         while(Boolean(this.checkPoints.length))
         {
            this.checkPoints.pop();
         }
         removeChild(gfxArrow);
         if(this.coreInterface.paused)
         {
            this.togglePause();
         }
         this._player.remove();
         this.coreInterface.destroyExcluders();
         this.removeModels();
         if(aborted)
         {
            this.processFrontend(true);
         }
      }
      
      protected function togglePause() : void
      {
         this.coreInterface.paused = !this.coreInterface.paused;
         if(this.coreInterface.paused)
         {
            addChild(gfxPaused);
            this._player.setEngineVolume(true);
            gfxPaused.getChildByName("btn_mainmenu").addEventListener(MouseEvent.CLICK,this.onPauseAbort);
            gfxPaused.getChildByName("appGet_btn").addEventListener(MouseEvent.CLICK,this.appGet);
            gfxPaused.getChildByName("appGetPlay_btn").addEventListener(MouseEvent.CLICK,this.appGetPlay);
            gfxPaused.getChildByName("appGetAmazon_btn").addEventListener(MouseEvent.CLICK,this.appGetAmazon);
            gfxPaused.getChildByName("btn_retry").addEventListener(MouseEvent.CLICK,this.onPauseRetry);
            if(this.startLampActive)
            {
               gfxCount.stop();
            }
         }
         else
         {
            removeChild(gfxPaused);
            this._player.setEngineVolume(false);
            if(this.startLampActive)
            {
               gfxCount.play();
            }
            stage.focus = this;
         }
      }
      
      private function onPauseAbort(e:MouseEvent) : void
      {
         this.stopGame(true);
      }
      
      private function onPauseRetry(e:MouseEvent) : void
      {
         this.stopGame(false);
         this.reset();
         this.startGame();
      }
      
      protected function updateCamera(smooth:Number) : void
      {
         var m:Matrix3D = new Matrix3D();
         if(this.gameState == core_gamestate.FRONTEND)
         {
            m.position = new Vector3D(-88.6 + Math.sin(this._frameCounter * 0.005),11.785 + Math.sin(this._frameCounter * 0.05),-243.324 + Math.cos(this._frameCounter * 0.05));
            if(scrTitle != null)
            {
               m.pointAt(new Vector3D(33.582,25.518,-140.937),Vector3D.Z_AXIS,Vector3D.Y_AXIS);
            }
            else if(scrInstructions != null)
            {
               m.pointAt(new Vector3D(-108.428,15.937,-199.664),Vector3D.Z_AXIS,Vector3D.Y_AXIS);
            }
            this.coreInterface.cameraMatrix.interpolateTo(m,smooth);
            this.coreInterface.camera.matrix = this.coreInterface.cameraMatrix;
            return;
         }
         var p:Vector3D = this._player.mtx.position.clone();
         var axisz:Vector3D = new Vector3D(this._player.mtx.rawData[8],this._player.mtx.rawData[9],this._player.mtx.rawData[10]);
         if(this.gameState == core_gamestate.ENDGAME)
         {
            p.y += 200;
            p.x += 200;
            p.z += 200;
            if(p.y < 100)
            {
               p.y = 100;
            }
         }
         else
         {
            axisz.scaleBy(-90);
            p.incrementBy(axisz);
            p.y += 40;
         }
         m.position = p;
         var t:Vector3D = this._player.mtx.position.clone();
         if(this.gameState != core_gamestate.ENDGAME)
         {
            t.decrementBy(axisz);
         }
         m.pointAt(t,Vector3D.Z_AXIS,Vector3D.Y_AXIS);
         this.coreInterface.cameraMatrix.interpolateTo(m,smooth);
         this.coreInterface.camera.matrix = this.coreInterface.cameraMatrix;
      }
      
      protected function updateArrow() : void
      {
         var cos:Number = NaN;
         var rim:Number = 50;
         var pos2d:Vector3D = this.coreInterface.camera.projectGlobal(this.ringIndicator.matrix.position);
         if(!(pos2d.x > 0 && pos2d.x < stage.stageWidth && pos2d.y > 0 && pos2d.y < stage.stageHeight) || pos2d.z < 0)
         {
            pos2d.x = this.coreInterface.limit(pos2d.x,rim,stage.stageWidth - rim);
            pos2d.y = this.coreInterface.limit(pos2d.y,rim,stage.stageHeight - rim);
            if(pos2d.z < 0)
            {
               pos2d.x = stage.stageWidth - pos2d.x;
               pos2d.y = stage.stageHeight - pos2d.y;
               if(pos2d.x > rim || pos2d.x < stage.stageWidth - rim)
               {
                  if(rim <= stage.stageWidth / 2)
                  {
                     pos2d.x = rim;
                  }
                  else
                  {
                     pos2d.x = stage.stageWidth - rim;
                  }
               }
               if(pos2d.y > rim || pos2d.y < stage.stageHeight - rim)
               {
                  if(rim <= stage.stageHeight / 2)
                  {
                     pos2d.y = rim;
                  }
                  else
                  {
                     pos2d.y = stage.stageHeight - rim;
                  }
               }
            }
            gfxArrow.alpha = this.coreInterface.lerp(gfxArrow.alpha,1,0.1);
            gfxArrow.x = pos2d.x;
            gfxArrow.y = pos2d.y;
            pos2d.decrementBy(new Vector3D(stage.stageWidth / 2,stage.stageHeight / 2,pos2d.z));
            pos2d.normalize();
            cos = Math.acos(Vector3D.Y_AXIS.dotProduct(pos2d));
            if(Vector3D.X_AXIS.dotProduct(pos2d) > 0)
            {
               cos *= -1;
            }
            gfxArrow.rotation = cos * (180 / Math.PI) - 90;
         }
         else
         {
            gfxArrow.alpha = this.coreInterface.lerp(gfxArrow.alpha,0,0.1);
         }
      }
      
      protected function updateStats(dt:Number) : void
      {
         if(this.gameState == core_gamestate.INGAME)
         {
            this.game_time += dt;
            this.level_time += dt;
         }
         gfxHud.getChildByName("live01").visible = this.lives > 0;
         gfxHud.getChildByName("live02").visible = this.lives > 1;
         gfxHud.getChildByName("live03").visible = this.lives > 2;
         (gfxHud.getChildByName("currentlaptime_text") as TextField).text = this.coreInterface.formatTime(this.level_time);
         (gfxHud.getChildByName("ringsleft") as TextField).text = String(this.checkPoints.length);
      }
      
      protected function onEnterFrame(e:Event) : void
      {
         var tfader:DisplayObject = null;
         var dist:Number = NaN;
         var sfader:DisplayObject = null;
         var act_time:Number = new Date().getTime();
         var dt:Number = (act_time - this.last_time) / 1000;
         this.last_time = act_time;
         if(this.gameState == core_gamestate.UNDEFINED)
         {
            return;
         }
         if(this.gameState == core_gamestate.MENUFADEOUT)
         {
            gfxFader.alpha += dt * 2;
            if(gfxFader.alpha >= 1)
            {
               removeChild(gfxFader);
               this.startGame();
            }
            return;
         }
         if(this.gameState == core_gamestate.GAMEFADEIN)
         {
            this.coreInterface.physics.engine.integrate(0.12);
            this._player.update(dt);
            this.updateCamera(0.15);
            this.updateStats(dt);
            if(gfxFader.parent != null)
            {
               gfxFader.alpha -= dt;
               if(gfxFader.alpha <= 0)
               {
                  removeChild(gfxFader);
               }
            }
            if(gfxCount.currentFrame == 90)
            {
               removeChild(gfxCount);
               this.startLampActive = false;
               this.gameState = core_gamestate.INGAME;
            }
         }
         else if(this.gameState == core_gamestate.FRONTEND)
         {
            this.updateCamera(0.1);
            if(scrTitle != null)
            {
               tfader = scrTitle.getChildByName("fader");
               if(tfader.visible)
               {
                  tfader.alpha -= 0.1;
                  if(tfader.alpha <= 0)
                  {
                     tfader.visible = false;
                  }
               }
            }
         }
         else if(this.gameState == core_gamestate.INGAME || this.gameState == core_gamestate.ENDGAME)
         {
            if(!this.coreInterface.paused)
            {
               this.coreInterface.drawSurface.graphics.clear();
               this.coreInterface.physics.engine.integrate(0.12);
               this._player.update(dt);
               this.updateCamera(0.15);
               this.updateStats(dt);
               if(this.gameState == core_gamestate.INGAME)
               {
                  if(this._player.isCrashed())
                  {
                     this.triggerFail(false);
                  }
                  else if(Boolean(this.checkPoints.length))
                  {
                     this.ringIndicator.matrix = this.checkPoints[0];
                     this.ringIndicator.alpha = Math.abs(Math.sin(this._frameCounter * 0.1));
                     this.updateArrow();
                     dist = this.checkPoints[0].position.subtract(this._player.mtx.position).length;
                     if(dist < this.coreInterface._controlPointDistance)
                     {
                        this.checkPoints.shift();
                        if(this.coreInterface.soundEnabled)
                        {
                           this.sndCPPass.playLoadedSound();
                        }
                     }
                     else if(dist > 6000 || this._player.mtx.position.y < 0)
                     {
                        this.triggerFail();
                     }
                  }
                  else
                  {
                     this.triggerEnd();
                  }
               }
               else if(this._fadeOutTime > 0)
               {
                  this._fadeOutTime -= dt;
               }
               else
               {
                  if(scrStatFail != null)
                  {
                     sfader = scrStatFail.getChildByName("fader");
                  }
                  else if(scrStatWin != null)
                  {
                     sfader = scrStatWin.getChildByName("fader");
                  }
                  else if(scrWin != null)
                  {
                     sfader = scrWin.getChildByName("fader");
                  }
                  if(Boolean(sfader))
                  {
                     if(!sfader.visible)
                     {
                        sfader.visible = true;
                        sfader.alpha = 0;
                     }
                     else
                     {
                        sfader.alpha += dt;
                        if(sfader.alpha > 1)
                        {
                           sfader.alpha = 1;
                        }
                     }
                  }
               }
               if(this.coreInterface.levelDebug)
               {
                  this.coreInterface.drawExcluders();
                  this._player.draw();
               }
            }
         }
         ++this._frameCounter;
         this.coreInterface.camera.render();
      }
   }
}

