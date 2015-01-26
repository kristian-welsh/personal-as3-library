package kris.test {
	import asunit.framework.TestSuite;
	import kris.test.SuiteProvider;
	
	public class TestSuiteCollector extends TestSuite {
		protected function includeTestsFrom(testClass:Class):void {
			invalidate(testClass)
			var instance:Object = new testClass()
			assert(instance is SuiteProvider, "class must implement SuiteProvider")
			addTest(instance.getSuite());
		}
		
		private function invalidate(testClass:Class):void {
			try {
				new testClass()
				new testClass("")
			} catch (error:ArgumentError) {
				fail("Class " + testClass + " not loaded, argument error detected.")
			}
			assert(new testClass() is SuiteProvider, "class must implement SuiteProvider")
		}
	}
}