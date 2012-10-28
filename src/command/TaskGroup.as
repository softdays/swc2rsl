package command
{
	import mx.collections.ArrayCollection;
	import mx.collections.IList;

	public class TaskGroup
	{
		private var tasks:Array = new Array();
		
		private var _onComplete:Function;
		private var _onError:Function;
		
		public function TaskGroup()
		{
			super();			
		}
		
		public function addTask(task:ITask):void
		{
			tasks.push(task);
		}
		
		public function executeAllStuff(onCompleted:Function=null, onError:Function=null):void
		{
			_onComplete = onCompleted;
			_onError = onError;
			nextTask();
		}
		
		private function nextTask():void
		{
			if (tasks.length > 0)
			{
				var task:ITask = tasks.shift();	
				task.execute(nextTask, _onError);
			}
			else
			{
				if (_onComplete != null)
				{
					_onComplete();
				}
			}
		}

	}
}