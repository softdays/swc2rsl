package command
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.geom.PerspectiveProjection;
	import flash.utils.ByteArray;
	
	import mx.utils.StringUtil;

	public class AbstractTask implements ITask
	{
		
		public function execute(onComplete:Function=null, onError:Function=null):void
		{
			var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo(); 
			var file:File = File.applicationDirectory.resolvePath(executablePath); 
			trace("executable: "+file.nativePath);
			nativeProcessStartupInfo.executable = file; 
			nativeProcessStartupInfo.arguments = processArgs; 
			nativeProcessStartupInfo.workingDirectory = File.documentsDirectory; 
			// start process
			var process:NativeProcess = new NativeProcess(); 			
			var console:ByteArray = new ByteArray(); 
			process.addEventListener(NativeProcessExitEvent.EXIT, 
				function(event:NativeProcessExitEvent):void
				{
					trace("NativeProcessExitEvent.exitCode: "+event.exitCode);
					if (event.exitCode == 0 && onComplete != null)
					{
						onComplete();
					}
					else
					{
						if (onError != null)
						{
							onError();
						}
					}
				}
			);
			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, 
				function dataHandler(event:ProgressEvent):void 
				{					
					process.standardOutput.readBytes(console); 
					trace(StringUtil.trim(console.toString()));
				}
			); 
			process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, 
				function errorDataHandler(event:ProgressEvent):void 
				{ 
					process.standardError.readBytes(console); 
					trace(StringUtil.trim(console.toString()));
					process.exit(true);
				}
			); 
			process.start(nativeProcessStartupInfo);			
		}
		
		public function get executablePath():String
		{
			throw new Error("This getter has to be overrided");
		}
		
		public function get processArgs():Vector.<String>
		{	
			throw new Error("This getter has to be overrided");
		}
		
	}
}