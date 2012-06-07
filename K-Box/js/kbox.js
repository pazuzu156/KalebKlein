/*!
 * kBox - jQuery Modal Box
 *
 * Great jQuery modal box plugin
 * That will create a box for you :)
 * May be used however you see fit.
 *
 * Have fun creating boxes without
 * The need of actially programming them :)
 *
 * (c) 2012 Kaleb Klein - All Rights Reserved
 */

$.fn.kbox = function(options) {
	
	// Defaults for invoking
	// Plugin, can be changed
	var defaults = {
		open: false,
		speed: 500
	}
	
	// Extend defaults to options param
	// within the function invoke
	var options = $.extend(defaults, options);
	
	// Create box elements
	var mask           = $('<div id="mask"></div>'),
		box            = $('<div id="box"></div>'),
		cDiv           = $('<div id="boxContent"></div>'),
		modalContent   = $('div[name=kb-modal]'),
		title          = $(modalContent).attr('title'),
		head           = $('<div id="head"></div>'),
		close          = $('<div id="close" title="Click to close"></div>'),
		content        = $(modalContent).contents();
		
	// Using hide() because remove basically hides anyways
	// and not using remove causes text to remove itself
	// when hide, fadeOut or slideUp are invoked
	function closeBox() {
		mask.hide().remove();
		box.hide().remove();
		modalContent.html(cDiv.contents());
	}
	
	// For creating a single box from an element
	//
	// For building box, creating the box, and display
	// Also for destroying the box when closed for another
	// Invoke if wanted
	$(this).each(function() {
		mask.appendTo("body");
		box.appendTo("body");
		if(title) {
			head.html("<h3>" + title + "</h3>").appendTo(box);
			close.appendTo(mask);
		} else {
			close.appendTo(mask);
		}
		cDiv.html(content).appendTo(box);
		
		var maskWidth    = $(document).width()
			maskHeight   = $(document).height(),
			windowWidth  = $(window).width(),
			windowHeight = $(window).height(),
			boxWidth     = box.outerWidth(),
			boxHeight    = box.outerHeight(),
			scrollTop    = $(window).scrollTop(),
			scrollLeft   = $(window).scrollLeft();
		
		maskHeight = maskHeight - 30 + "px";
		mask.css({ 'width' : maskWidth, 'height' : maskHeight});
		
		box.css({
			'top' : ((windowHeight - boxHeight) / 2) + scrollTop + "px",
			'left' : ((windowWidth - boxWidth) / 2) + scrollTop + "px"
		});
		
		close.css({
			'top' : ((windowHeight - boxHeight) / 2) + scrollTop - 13 + "px",
			'left' : ((windowWidth - boxWidth) / 2) + scrollLeft - 13 + "px"
		});
		
		close.click(function() {
			closeBox();
		});
		
		mask.click(function() {
			closeBox();
		});
		
		if(defaults.open==true) {
			box.slideDown(defaults.speed);
			mask.fadeIn(defaults.speed);
		}
	});
}

/*!
 * Usage is simple, everything
 * here is already pre-configured
 * to work with pre-defined attribute
 * values defined in HTML pages.
 *
 * EX: <a href="#kb-init">Initialize</a>
 * <div name="kb-modal" title="My Title">My Content</div>
 *
 * Defaults here are to open, and set the opening and closing speeds
 * They can be changed to fit your needs.
 */

$(document).ready(function() {
	$("a").click(function() {
		if(this.hash) {
			var init = this.hash.substr(1);
			if(init=="kb-init") {
				$("div[name=kb-modal]").kbox({
					open: true, // DO NOT CHANGE! Box will not work if set to false!
					speed: 500, // Default speed for showing box, may be changed :)
				});
				return false; // For any hashed links, BUT only if kb-init included
			}
		}
	});
});