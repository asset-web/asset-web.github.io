$(document).ready(function(){

	$('a[title],abbr[title]').each(function(){

		$(this).qtip(); // Grab each element and to apply the tooltip to
	})
})