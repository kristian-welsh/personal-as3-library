package kris.test {
	import flash.display.MovieClip;
	import kris.test.Spy;
	
	/**
	 * Since you can't change the frame number of a movieclip created by code, use this class to test calls to gotoAndStop.
	 */
	public class MovieClipSpy extends MovieClip {
		private var _spy:Spy;
		private var _fakeCurrentFrame:int;
		
		public function MovieClipSpy() {
			_spy = new Spy(this);
			super();
		}
		
		public function get spy():Spy {
			return _spy;
		}
		
		override public function gotoAndStop(frame:Object, scene:String = null):void {
			_spy.log(gotoAndStop, [frame, scene]);
			_fakeCurrentFrame = frame as int;
		}
		
		override public function get currentFrame():int {
			return _fakeCurrentFrame;
		}
	}
}