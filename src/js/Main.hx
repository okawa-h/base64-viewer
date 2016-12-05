package ;

import js.jquery.JQuery;
import js.jquery.Event;
import Read;

class Main {

	public static function main():Void {

		new JQuery('document').ready(init);

	}

	private static function init(event:Event):Void {

		Read.init();

	}

	public static function onRead(src:String):Void {

		new JQuery('#image').html('<img src="'+src+'">');
		new JQuery('#data').find('[name="data"]').val(src);

	}

}
