/*
	Author: Kristian Welsh
	
	ALWAYS DO THIS FIRST:
	Keys.init(stage);
			
	THEN YOU CAN DO THESE:
	Keys.returnKey(5);
	Keys.returnArray(37,38,39,40);
	Keys.returnLastKey(37,38,39,40);	
*/
package{
	
	import flash.events.KeyboardEvent;
	import flash.display.DisplayObjectContainer;
	
	public class Keys{
		
		private static const _LARGEST_KEYCODE:uint = 222;
		
		private static var _keyArr:Array = new Array(_LARGEST_KEYCODE);
		// Contains boolean values for each keycode
		private static var _lastKey:int=0;
		// Last key pressed
		private static var _lastValidKey:int=0;
		// Last valid key pressed (declared in class scope to retain value through till end
		
		
		// PUBLIC FUNCTIONS:
		
		public static function init(stageInput:DisplayObjectContainer):void
		{
			// Prepares class for use, call this once before you start using the other functions
			
			for (var i=0; i<_LARGEST_KEYCODE; i++){
				_keyArr[i]=false;
			} 
			
			stageInput.addEventListener(KeyboardEvent.KEY_DOWN, keyD);
			stageInput.addEventListener(KeyboardEvent.KEY_UP, keyU);
			
		}
		
		public static function returnKey(index:int):Boolean
		{
			// Returns a single value from _keyArr at the index of INDEX
			
			return _keyArr[index]
			
		}
		
		public static function returnArray(... args):Array
		{
			// Returns values from _keyArr at the locations passed as the parameter(s)
			
			var returnMe:Array=[]
			
			for (var i=0; i<args.length; i++){
				returnMe[i]=_keyArr[args[i]];
				//Extracts the values of the keys passed in as args from the key array.
			}
			
			return returnMe;
		}
		
		public static function returnLastKeyPressed(... args):uint
		{
			// Returns the keyCode of the key most recently depressed from the argument list
			
			if(args.indexOf(_lastKey)!=-1)
				_lastValidKey=_lastKey;
			
			return _lastValidKey
			
		}
		
		// PRIVATE FUNCTIONS:
		
		private static function keyD(event:KeyboardEvent):void
		{
			// Sets the pressed key's value to true
			_keyArr[event.keyCode]=true;
			_lastKey=event.keyCode;
			trace(_lastKey);
		}
		
		private static function keyU(event:KeyboardEvent):void
		{
			// Sets the pressed key's value to false
			_keyArr[event.keyCode]=false;
		}
	}
}