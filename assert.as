package {
	import asunit.errors.AssertionFailedError
	
	public function assert(condition:Object, message:String = ""):void {
		if(!condition)
			throw new AssertionFailedError(message || "Assertion Failed");
	}
}
