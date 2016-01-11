package src 
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.TouchEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class SoundButton extends Sprite
	{
		private var _sound:Sound;
		private var _sndTrans:SoundTransform;
		private var _channels:Array;
		public function SoundButton(color:uint, label:String, channels:Array) 
		{
			/*
			 * 
			 * Make a reference to the channels variable that's passed as an argument
			 * 
			 */
			_channels = channels;
			/*
			 * Just some drawings and text
			 */
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = "verdana";
			textFormat.size = 20;
			
			var textfield:TextField = new TextField();
			textfield.text = "" + label;
			textfield.setTextFormat(textFormat);
			textfield.width = textfield.textWidth + 5;
			textfield.height = textfield.textHeight + 5;
			addChild(textfield);
			
			var width:Number = textfield.textWidth + 15;
			var height:Number = textfield.textHeight +15;
			
			this.graphics.beginFill(color, alpha);
			this.graphics.lineStyle(0x000000);
			this.graphics.drawRect(0, 0, width, height);
			
			/*
			 * object needed for Adjusting volume and panning
			 */
			_sndTrans = new SoundTransform(1,0);
			
			/*
			 * listen to a tap
			 */			
			this.addEventListener(TouchEvent.TOUCH_TAP, play);			
		}
		public function loadSound(url:String):void
		{
			var urlReq:URLRequest = new URLRequest(url);
			_sound = new Sound(urlReq);				
		}
		public function changePan(value:Number):void
		{
			_sndTrans.pan = value;			
		}
		public function changeVolume(value:Number):void
		{
			_sndTrans.volume = value;			
		}
		private function play(e:TouchEvent):void 
		{
			/*
			 * 
			 * Check if the variable _sound has a value
			 * if it's null there is no sound loaded and throw a custom errormessage
			 * 
			 */			
			if (_sound == null)
			{
				throw new Error("No sound is loaded into " + this + " use loadSound() method", 1);
				
			}else
			{
				_channels.push(_sound.play(0, 1, _sndTrans));	
			}				
		}		
	}
}