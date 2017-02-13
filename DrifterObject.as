//DrifterObject.as
//client code
package {
	import flash.geom.Rectangle;
	import flash.display.BitmapData;
	import zengine.math.Vector2;
	import zengine.entity.ZengineObject;
	public class DrifterObject extends ZengineObject {
		private var g_field:Rectangle;
		public function DrifterObject(t:BitmapData, pos:Vector2,mass:Number,r:Rectangle ,guid:int, g_field:Rectangle) {
			super(t,pos,mass,r,guid);
			if(g_field != null) {
				this.g_field = g_field.clone();
				this.g_field.inflate(100, 100);
			}
			else {
				this.g_field = super.getPhysicalComponent().representation.clone();
			}
			this.g_field.x = super.getPhysicalComponent().getPos().y;
			this.g_field.y = super.getPhysicalComponent().getPos().x;
		}
		public function getGravitationalField():Rectangle {
			return g_field;
		}
	}
}