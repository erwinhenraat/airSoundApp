package src 
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.TouchEvent;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class SoundButton extends Sprite
	{
		private var _sound:Sound;
		private var _sndTrans:SoundTransform;
		public function SoundButton(color:uint, label:String) 
		{			
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
			this.graphics.drawRect(0, 0, width, height);
			
			this.addEventListener(TouchEvent.TOUCH_TAP, play);
		
			_sndTrans = new SoundTransform(1, 0);
			
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
			trace("play");
			
			if (_sound == null)
			{
				
				throw new Error("No sound is loaded into " + this + " use loadSound() method", 1);
				
			}else
			{
				
				_sound.play(0, 1, _sndTrans);	
			}
			
			
		}
		
		
	}

}