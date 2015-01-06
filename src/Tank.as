package  
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Dylan Waij
	 */
	public class Tank extends MovieClip
	{
		private var tankBody:TankBodyArt;
		private var tankTurret:TankTurretArt;
		private var controlDir:Point;		
		private var speed:Number = 0;
		public var turretAngle:Number = 0;
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			tankBody = new TankBodyArt();
			this.addChild(tankBody);
			tankTurret = new TankTurretArt();
			this.addChild(tankTurret);	
			controlDir = new Point(0,0);
			
			this.scaleX = this.scaleY = 0.2;
		}		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}		
		private function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event("onShoot"));
		}		
		private function loop(e:Event):void 
		{		
			speed = controlDir.y * -5;			
			this.rotation += controlDir.x * 3; 
			
			var radian:Number = this.rotation * Math.PI / 180;
			var xMove:Number = Math.cos(radian);				
			var yMove:Number = Math.sin(radian);	
			this.x += xMove * speed;
			this.y += yMove * speed;
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			
			radian = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI;
			
			tankTurret.rotation = angle;
			turretAngle = tankTurret.rotation;
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{				
				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.A)
			{				
				controlDir.x = 0;
			}
			if (e.keyCode == Keyboard.S)
			{				
				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.D)
			{					
				controlDir.x = 0;
			}
		}		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				controlDir.y = -1;
			}
			if (e.keyCode == Keyboard.A)
			{
				controlDir.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				controlDir.y = 1;
			}
			if (e.keyCode == Keyboard.D)
			{
				controlDir.x = 1;
			}
		}
	}
}