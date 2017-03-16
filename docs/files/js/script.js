// Generated by Haxe 3.4.0
(function () { "use strict";
var Main = function() { };
Main.main = function() {
	$("document").ready(Main.init);
};
Main.init = function(event) {
	Read.init();
};
Main.onRead = function(src) {
	$("#image").html("<img src=\"" + src + "\">");
	$("#data").find("[name=\"data\"]").val(src);
};
var Read = function() { };
Read.init = function() {
	Read._jParent = $("#read");
	Read._jBtn = Read._jParent.find(".button");
	Read._jSubmit = Read._jParent.find("input[name=\"read-file\"]");
	$(window).on({ drop : Read.onDrop, dragenter : Read.onEnter, dragover : Read.onOver});
	Read._jBtn.on("click",null,function(event) {
		Read._jSubmit.click();
	});
	Read._jSubmit.on({ "change" : Read.onChange});
};
Read.readFile = function(file) {
	var fileReader = new FileReader();
	fileReader.onload = function(event) {
		Read.cancel(event);
		var src = event.target.result;
		Main.onRead(src);
	};
	fileReader.readAsDataURL(file);
};
Read.onChange = function(event) {
	var file = event.originalEvent.target.files[0];
	Read.readFile(file);
};
Read.onDrop = function(event) {
	var file = event.originalEvent.dataTransfer.files[0];
	Read.readFile(file);
	return false;
};
Read.onEnter = function(event) {
	Read.cancel(event);
	return false;
};
Read.onOver = function(event) {
	Read.cancel(event);
	return false;
};
Read.cancel = function(event) {
	event.preventDefault();
	event.stopPropagation();
};
Main.main();
})();
