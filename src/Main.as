package src 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.media.SoundChannel;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Main extends MovieClip
	{
		private var channels:Array = [];
		public function Main() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			
			/*
			 * first soundButton
			 */
			var sb1:SoundButton = new SoundButton(0xff00ff, "What does the cow say?", channels);
			sb1.loadSound("http://hnr.hosts.ma-cloud.nl/media/sound/cow.mp3");
			sb1.x = 100;
			sb1.y = 100;
			sb1.changePan( -1);//left speaker
			sb1.changeVolume( 0.2);//20% volume
			addChild(sb1);
			
			
			/*
			 * another sound button which gives a custom error. Why? tip check out the play() finction in the SoundButton class
			 */
			var sb2:SoundButton = new SoundButton(0xffff00, "don't press me", channels);
			sb2.x = 200;
			sb2.y = 150;
			addChild(sb2);
			
			
			/*
			 * another button used to stop all sounds in the channel
			 */
			var stop:StopButton = new StopButton(channels);
			stop.x = stage.stageWidth - stop.width/2;
			stop.y = 0 + stop.height/2;
			addChild(stop);
			
		}
		
	}

}