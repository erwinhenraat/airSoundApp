package src 
{
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Main extends MovieClip
	{
		
		public function Main() 
		{
			trace("hallo ");
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var sb1:SoundButton = new SoundButton(0xff00ff, "What does the cow say?");
			sb1.loadSound("http://hnr.hosts.ma-cloud.nl/media/sound/cow.mp3");
			sb1.x = 100;
			sb1.y = 100;
			addChild(sb1);
			
			
			
			var sb2:SoundButton = new SoundButton(0xffff00, "Hello");
			sb2.x = 200;
			sb2.y = 150;
			addChild(sb2);
		}
		
	}

}