package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;

	public class TaskUpdateSwcDigest extends AbstractTask
	{
		private var _fdkHome:String;
		private static const PATH_EXE:String = File.separator + "bin" + File.separator + "digest.exe";
		private var _rslPath:String;
		private var _swcPath:String;
		
		public function TaskUpdateSwcDigest(fdkHome:String, swcPath:String, rslPath:String)
		{
			super();
			_fdkHome = fdkHome;
			_rslPath = rslPath;
			_swcPath = swcPath; 			
		}
		
		override public function get executablePath():String
		{
			return _fdkHome+PATH_EXE;
		}
		
		override public function get processArgs():Vector.<String>
		{
			var processArgs:Vector.<String> = new Vector.<String>(); 
			processArgs.push("--digest.rsl-file");
			processArgs.push(_rslPath);
			processArgs.push("--digest.swc-path");
			processArgs.push(_swcPath);
			
			return processArgs;
		}
		
	}
}