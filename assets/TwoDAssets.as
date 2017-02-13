//TwoDAssets.as
package assets {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	public class TwoDAssets {
		[Embed(source="/assets/hazmat_man.png")]
		[Bindable]
		private static var Texture1:Class;
		public static var texture1:BitmapData;
		
		[Embed(source="/assets/asteroid_small.png")]
		[Bindable]
		private static var Texture2:Class;
		public static var texture2:BitmapData;
		[Embed(source="/assets/asteroid_tiny.png")]
		[Bindable]
		private static var Texture3:Class;
		public static var texture3:BitmapData;
		public static function init():void {
			texture1 = (new Texture1() as Bitmap).bitmapData;
			texture2 = (new Texture2() as Bitmap).bitmapData;
			texture3 = (new Texture3() as Bitmap).bitmapData;
			
		}
	}
}