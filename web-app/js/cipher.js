window.onload = function() {
	$('.character')
	.hover(
		function () {
			var classes = $(this).attr('class').split(" ");
			var classesString = "";
			for (var i = 0; i < classes.length; i++) {
				if (classes[i] != 'match') {
					classesString += "." + classes[i];
				}
			}
			$(classesString).toggleClass('highlighted');
		}
	);
};