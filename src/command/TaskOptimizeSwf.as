package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class TaskOptimizeSwf extends AbstractTask
	{
		private var _fdkHome:String;
		private static const PATH_EXE:String = File.separator + "bin" + File.separator + "optimizer.exe";
		private var _libSwfPath:String;
		private var _outputRslFile:String = "rsl.swf";
		
		public function TaskOptimizeSwf(fdkHome:String, libSwfPath:String, outputRslFile:String=null)
		{
			super();
			_fdkHome = fdkHome;
			_libSwfPath = libSwfPath;
			if (_outputRslFile) 
			{
				_outputRslFile = outputRslFile;
			}
			
		}
		
		override public function get executablePath():String
		{
			return _fdkHome+PATH_EXE;
		}
		
		override public function get processArgs():Vector.<String>
		{
			var processArgs:Vector.<String> = new Vector.<String>(); 
			processArgs.push('-keep-as3-metadata="Bindable,Managed,ChangeEvent,NonCommittingChangeEvent,Transient"');
			processArgs.push("-input");
			processArgs.push(_libSwfPath);
			processArgs.push("-output");
			processArgs.push(_outputRslFile);
			
			return processArgs;
		}
		
	}
}