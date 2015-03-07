package kris.collections.que {
	public class Que {
		private const OVERFLOW_ERROR:QueError = new QueError(QueError.NEXT_OVERFLOW)
		
		private var contents:Array;
		private var currentPosition:uint;
		
		public function Que(... contents) {
			setContentsFromArray(contents)
		}
		
		public function setContents(... contents):void {
			setContentsFromArray(contents)
		}
		
		public function setContentsFromArray(contents:Array):void {
			this.contents = contents;
			currentPosition = 0;
		}
		
		public function next():* {
			rejectOverflows()
			return contents[currentPosition++];
		}
		
		private function rejectOverflows():void {
			if (willOverflow())
				throw OVERFLOW_ERROR;
		}
		
		private function willOverflow():Boolean {
			return currentPosition >= contents.length;
		}
	}
}