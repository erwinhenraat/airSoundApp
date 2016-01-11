package src 
{
	import flash.display.Sprite;
	import flash.events.TouchEvent;
	import flash.media.SoundChannel;
	
	import flash.media.SoundMixer;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class StopButton extends Sprite
	{
		private var _channels:Array;
		public function StopButton(channels:Array) 
		{
			
			_channels = channels;
			this.graphics.beginFill(0xff0000, 1);
			this.graphics.lineStyle(2, 0x000000);
			this.graphics.drawCircle(0, 0, 20);
			
			this.addEventListener(TouchEvent.TOUCH_TAP, onTap);
		}
		
		private function onTap(e:TouchEvent):void 
		{			
			
			/*
			 * Stop all soundChannels bij looping through all the sound channels
			 */
			for (var i:int = 0; i < _channels.length; i++) 
			{
				_channels[i].stop();
			}
			_channels.splice(0, _channels.length);
			
			/*
			 * 
			 * another way to stop sounds is
			 * Make sure you import the SoundMixer class
			 * 
			 */			
			SoundMixer.stopAll();
		}
		
	}

}