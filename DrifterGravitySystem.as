//DrifterGravitySystem.as
package {
	import zengine.system.ISystem;
	import zengine.math.Vector2;
	
	public class DrifterGravitySystem implements ISystem {
		private var internal:Array = new Array(); 
		private var orbitals:Array = new Array();
		public function register(i:int):void {
			//only register objects you want to be effected;
			//effecters are added separetly;
			internal.push(i);
		}
		public function deregister(i:int):void {
		
		}
		public function addGravityEffecter(i:int):void {
			orbitals.push(i);
		}
		public function update(delta:Number):void {
			for(var i:int = 0; i < orbitals.length; i++) {
				var d1:DrifterObject = DrifterMain.mamaDukes[orbitals[i]];
				for(var j:int = 0; j < internal.length; j++) {
					var d2:DrifterObject = DrifterMain.mamaDukes[internal[j]];
					if(d2.getPhysicalComponent().representation.intersects(d1.getGravitationalField())) {
						var m1:Number = d1.getPhysicalComponent().mass;
						var m2:Number = d2.getPhysicalComponent().mass;
						var radius:Vector2 = d1.getPhysicalComponent().getPos().sub(d2.getPhysicalComponent().getPos());
						var force:Number = ( m1*m2 / (.5*radius.mag2()));
						var acc:Number = force / m2;
						d2.getPhysicalComponent().getVel().incX(radius.nor().x * acc);
						d2.getPhysicalComponent().getVel().incY(radius.nor().y * acc);
					}
					
					
				}
			}
		}
	}
}