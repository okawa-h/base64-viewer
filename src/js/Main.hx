package;

import js.jquery.JQuery;
import js.jquery.Event;
import Read;

class Main {

	private static inline var SAMPLE_DATA:String = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAPklEQVQoU2NkYGD4z0AEYIQqBNH4wH9khbhMBqtBV4huMkgzToUwk1EMwWYi0QqRPYXTamw+x3AjUcFDMMgBGMoeAUz+9+0AAAAASUVORK5CYII=';

	public static function main():Void {

		new JQuery('document').ready(init);

	}

	private static function init(event:Event):Void {

		Read.init();
		onRead(SAMPLE_DATA);

	}

	public static function onRead(src:String):Void {

		new JQuery('#image').html('<img src="$src">');
		new JQuery('#data').find('[name="data"]').val(src);

	}

}
