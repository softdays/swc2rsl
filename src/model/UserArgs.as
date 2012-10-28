package model
{
	[Bindable]
	public class UserArgs
	{
		public var fdkHome:String;
		public var swcFilePath:String;
		public var swcFileDir:String;
		public var artifactId:String;
		public var version:String;
		
		public static const DEFAULT_OUTPUT_ITEM:String = "Same directory as SWC library file";
		public static const CUSTOM_OUTPUT_ITEM:String = "Select your output directory...";
		
		public var outputDir:String = DEFAULT_OUTPUT_ITEM;
		
		
		public function UserArgs()
		{
			super();
		}
	}
}