package
{
   import flash.events.Event;
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class MP3Player
   {
      
      private var _playbackSpeed:Number = 1;
      
      private var _mp3:Sound;
      
      private var _loadedMP3Samples:ByteArray;
      
      private var _dynamicSound:Sound;
      
      private var _phase:Number;
      
      private var _numSamples:int;
      
      private var bytes:ByteArray;
      
      private var nVolume:Number;
      
      private var nPan:Number;
      
      private var sChannel:SoundChannel;
      
      private var sTransform:SoundTransform;
      
      private var simple:Boolean;
      
      public function MP3Player(s:Sound, isSimple:Boolean)
      {
         super();
         this.nVolume = 1;
         this.sTransform = new SoundTransform();
         this.simple = isSimple;
         if(isSimple)
         {
            this._mp3 = s;
            this.sChannel = null;
            this.sTransform.volume = this.nVolume;
         }
         else
         {
            this.bytes = new ByteArray();
            s.extract(this.bytes,int(s.length * 44.1));
            this.nPan = 0;
            this.sChannel = new SoundChannel();
            this.sTransform = new SoundTransform();
         }
      }
      
      public function set playbackSpeed(value:Number) : void
      {
         this._playbackSpeed = value;
      }
      
      public function isPlaying() : Boolean
      {
         if(this.simple)
         {
            return this.sChannel != null;
         }
         return this._dynamicSound != null;
      }
      
      public function setVolumeAndPan(vol:Number, pan:Number = 0) : void
      {
         this.nVolume = vol;
         this.nPan = pan;
         if(this.isPlaying())
         {
            this.sTransform.volume = this.nVolume;
            this.sTransform.pan = this.nPan;
            this.sChannel.soundTransform = this.sTransform;
         }
      }
      
      public function getVolume() : Number
      {
         return this.nVolume;
      }
      
      public function loadAndPlay(request:URLRequest) : void
      {
         this._mp3 = new Sound();
         this._mp3.addEventListener(Event.COMPLETE,this.mp3Complete);
         this._mp3.load(request);
      }
      
      public function playLoadedSound(startTime:Number = 0, loop:Boolean = false) : void
      {
         if(this.simple)
         {
            this.sChannel = this._mp3.play(startTime,loop ? int.MAX_VALUE : 0,this.sTransform);
         }
         else
         {
            this.play(this.bytes);
         }
      }
      
      public function stop() : void
      {
         if(this.simple)
         {
            if(this.sChannel != null)
            {
               this.sChannel.stop();
               this.sChannel = null;
            }
         }
         else if(this._dynamicSound != null)
         {
            this._dynamicSound.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._dynamicSound = null;
         }
      }
      
      private function mp3Complete(event:Event) : void
      {
         this.playLoadedSound(0);
      }
      
      private function play(bytes:ByteArray) : void
      {
         this.stop();
         this._dynamicSound = new Sound();
         this._dynamicSound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this._loadedMP3Samples = bytes;
         this._numSamples = bytes.length / 8;
         this._phase = 0;
         this.sChannel = this._dynamicSound.play();
         this.sTransform.volume = this.nVolume;
         this.sTransform.pan = this.nPan;
         this.sChannel.soundTransform = this.sTransform;
      }
      
      private function onSampleData(event:SampleDataEvent) : void
      {
         var l:Number = NaN;
         var r:Number = NaN;
         var outputLength:int = 0;
         while(outputLength < 2048)
         {
            this._loadedMP3Samples.position = int(this._phase) * 8;
            l = this._loadedMP3Samples.readFloat();
            r = this._loadedMP3Samples.readFloat();
            event.data.writeFloat(l);
            event.data.writeFloat(r);
            outputLength++;
            this._phase += this._playbackSpeed;
            if(this._phase < 0)
            {
               this._phase += this._numSamples;
            }
            else if(this._phase >= this._numSamples)
            {
               this._phase -= this._numSamples;
            }
         }
      }
   }
}

