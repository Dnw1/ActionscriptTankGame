package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Dylan Waij
	 */
	public class Chest extends Sprite
	{
		private var chestArt:MovieClip;
		public var lives:int = 5;
		public function Chest() 
		{
			chestArt = new ChestArt();
			addChild(chestArt);
		}
		
	}

}