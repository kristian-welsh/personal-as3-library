package kris.test {
	import asunit.framework.TestSuite;
	import kris.test.SuiteProvider;
	
	public class TestSuiteCollector extends TestSuite {
		protected function includeTestsFrom(testClass:Class):void {
			var instance:Object = new testClass()
			assert(instance is SuiteProvider, "class must implement SuiteProvider")
			addTest(instance.getSuite());
		}
	}
}