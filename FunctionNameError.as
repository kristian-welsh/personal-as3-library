package kris {
	public class FunctionNameError extends Error {
		public function FunctionNameError(message:String = "") {
			super(message);
			this.name = "FunctionNameError"
		}
	}
}