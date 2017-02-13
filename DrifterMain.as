//test action script and mxmlc
package {
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.utils.Timer;
	import flash.geom.Rectangle;
	import flash.events.TimerEvent;
	import zengine.system.InputSystem;
	import zengine.system.GraphicSystem;
	import zengine.system.MotionSystem;
	import zengine.system.PhysicsSystem;
	import zengine.entity.ZengineObject;
	import assets.TwoDAssets;
	import zengine.math.Vector2;
	public class DrifterMain extends MovieClip {  //main always extends at least sprite Sprite --> MovieClip
	
		public static var mamaDukes:Array = new Array();
		private var g:GraphicSystem = new GraphicSystem(stage);
		private var i:InputSystem = new InputSystem(stage);
		private var m:MotionSystem = new MotionSystem();
		private var p:PhysicsSystem = new PhysicsSystem();
		private var grav:DrifterGravitySystem = new DrifterGravitySystem();
		private var fps:int = int.MAX_VALUE;
		private var updateTimer:Timer = new Timer(60/fps);
		
		public function DrifterMain() {
			TwoDAssets.init();
			updateTimer.addEventListener(TimerEvent.TIMER, render);
			var pos1:Vector2 = new Vector2();
			var pos2:Vector2 = new Vector2();
			var pos3:Vector2 = new Vector2();
			var pos4:Vector2 = new Vector2();
			var pos5:Vector2 = new Vector2();
			
			var ceiling_pos:Vector2 = new Vector2();
			var floor_pos:Vector2 = new Vector2();
			var r1:Rectangle = new Rectangle();
			var r2:Rectangle = new Rectangle();
			var grect:Rectangle = new Rectangle();
			r1.height = 300;
			r1.width = 50;
			r2.width = 1000;
			r2.height = 50; //these are caps and walls
			grect.height = 150;
			grect.width  = 150;
			pos1.incX(0);
			pos2.incX(150);
			pos2.incY(150);
			pos3.incX(300);
			pos4.incX(-60);
			pos5.incX(500);
			ceiling_pos.incY(-70);
			floor_pos.incY(400);
			var po:DrifterObject = new DrifterObject(TwoDAssets.texture1,pos1,40,TwoDAssets.texture1.rect, 0, null);
			var po1:DrifterObject = new DrifterObject(TwoDAssets.texture2,pos2,500, TwoDAssets.texture2.rect,1, grect);
			var po2:DrifterObject = new DrifterObject(TwoDAssets.texture3,pos3,40, TwoDAssets.texture3.rect,2, null);
			var po3:DrifterObject = new DrifterObject(null, pos4, Number.MAX_VALUE, r1,3, null);
			var po4:DrifterObject = new DrifterObject(null, pos5, Number.MAX_VALUE, r1,4, null);
			var ceiling_obj:DrifterObject = new DrifterObject(null, ceiling_pos, Number.MAX_VALUE, r2,5, null);
			var floor_obj:DrifterObject = new DrifterObject(null, floor_pos, Number.MAX_VALUE, r2, 6, null);
			
			mamaDukes[0] = po;
			mamaDukes[1] = po1;
			mamaDukes[2] = po2;
			mamaDukes[3] = po3;
			mamaDukes[4] = po4;
			mamaDukes[5] = ceiling_obj;
			mamaDukes[6] = floor_obj;
			g.register(0);
			g.register(1);
			g.register(2);
			m.register(0);
			//m.register(1);
			m.register(2);
			i.register(0);
			p.register(0);
			p.register(1);
			p.register(2);
			p.register(3);
			p.register(4);
			p.register(5);
			p.register(6);
			grav.register(0);
			grav.addGravityEffecter(1);
			
			updateTimer.start(); //enter render() execution cycle;
		}
		public function render(e:TimerEvent):void { //this is kind of a hack to have update methods
			g.update(60);
			i.update(60);
			m.update(60);
			p.update(60);
			grav.update(60);
			//trace("timer"); works!!!!
		}
		
	}
}
