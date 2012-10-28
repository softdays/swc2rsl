package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class TaskCleanUp extends AbstractTask
	{
		private var _outputDirPath:String;
		
		public function TaskCleanUp(outputDirPath:String)
		{
			super();
			_outputDirPath= outputDirPath;
		}
		
		override public function get executablePath():String
		{
			return "native" + File.separator + "cmd.exe";
		}
		
		override public function get processArgs():Vector.<String>
		{
			var processArgs:Vector.<String> = new Vector.<String>(); 
			processArgs.push("/C");
			processArgs.push("DEL");
			processArgs.push("/F");
			processArgs.push("/Q");
//			processArgs.push(_outputDirPath+File.separator+"locale");
			processArgs.push(_outputDirPath+File.separator+swc2rsl.LIBRARY_SWF);
//			processArgs.push(_outputDirPath+File.separator+"catalog.xml");
			
			return processArgs;
		}
		
	}
}