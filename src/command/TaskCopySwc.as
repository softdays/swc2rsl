package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class TaskCopySwc extends AbstractTask
	{
		private var _swcPath:String;
		private var _outputSwcPath:String;
		
		public function TaskCopySwc(swcPath:String, outputSwcPath:String)
		{
			super();
			_swcPath = swcPath;
			_outputSwcPath = outputSwcPath;
		}
		
		override public function get executablePath():String
		{
			return "C:\\WINDOWS\\system32\\cmd.exe";
		}
		
		override public function get processArgs():Vector.<String>
		{
			var processArgs:Vector.<String> = new Vector.<String>(); 
			processArgs.push("/C");
			processArgs.push("copy");
			processArgs.push("/Y");
			processArgs.push("/B");
			processArgs.push(_swcPath);
			processArgs.push(_outputSwcPath);
			
			return processArgs;
		}
		
	}
}