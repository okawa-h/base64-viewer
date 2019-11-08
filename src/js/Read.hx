package ;

import js.Browser;
import js.html.Blob;
import js.html.FileReader;
import js.jquery.JQuery;
import js.jquery.Event;

class Read {

	private static var _jParent:JQuery;
	private static var _jBtn:JQuery;
	private static var _jSubmit:JQuery;

	/* =======================================================================
		Constractar
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('#read');
		_jBtn = _jParent.find('.button');
		_jSubmit = _jParent.find('input[name="read-file"]');

		new JQuery(Browser.window).on({ drop: onDrop, dragenter: onEnter, dragover: onOver });

		_jBtn.on('click', (event:Event) -> _jSubmit.click());

		_jSubmit.on({ 'change': onChange });

	}

	/* =======================================================================
		Read File
	========================================================================== */
	private static function readFile(file:Blob):Void {

		var fileReader:FileReader = new FileReader();
		fileReader.onload = (event:Dynamic) -> {

			cancel(event);
			Main.onRead(event.target.result);

		};

		fileReader.readAsDataURL(file);

	}

	/* =======================================================================
		On Change
	========================================================================== */
	private static function onChange(event:Event):Void {

		var file:Blob = untyped event.originalEvent.target.files[0];
		readFile(file);

	}

	/* =======================================================================
		On Drop
	========================================================================== */
	private static function onDrop(event:Event):Bool {

		var file:Blob = untyped event.originalEvent.dataTransfer.files[0];
		readFile(file);
		return false;

	}

	/* =======================================================================
		On Enter
	========================================================================== */
	private static function onEnter(event:Event):Bool {

		cancel(event);
		return false;

	}

	/* =======================================================================
		On Over
	========================================================================== */
	private static function onOver(event:Event):Bool {

		cancel(event);
		return false;

	}

	/* =======================================================================
		Cancel
	========================================================================== */
	private static function cancel(event:Event):Void {

		event.preventDefault();
		event.stopPropagation();

	}

}