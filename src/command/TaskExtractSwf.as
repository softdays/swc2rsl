package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class TaskExtractSwf extends AbstractTask
	{
		private var _swcPath:String;
		private var _outputDir:String = "extracted";
		
		public function TaskExtractSwf(swcPath:String, outputDir:String=null)
		{
			super();
			_swcPath = swcPath;
			if (outputDir) 
			{
				_outputDir = outputDir;
			}			
		}
		
		override public function get executablePath():String
		{
			return "native" + File.separator + "7z.exe";
		}
		
		override public function get processArgs():Vector.<String>
		{
			var processArgs:Vector.<String> = new Vector.<String>(); 
			processArgs.push("e");
			processArgs.push("-y");
			processArgs.push("-o"+_outputDir);
			processArgs.push(_swcPath);
			processArgs.push(swc2rsl.LIBRARY_SWF);			
			
			return processArgs;
		}
		
	}
}