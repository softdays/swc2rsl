package command
{
	public interface ITask
	{
		
		function execute(onComplete:Function=null, onError:Function=null):void;
		
	}
}