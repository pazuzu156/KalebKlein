/*!
 *
 * iFade v 1.0
 * (c) 2011 Kaleb Klein - All Rights Reserved
 *
 * http://creativecommons.org/licenses/by/3.0/
 *
 */

(function($) {
	$.fn.iFade = function(options) {
		return this.each(function(i) {
			var $$ = $(this);
			var target = $$.css('backgroundImage').replace(/^url|[\(\)'"]/g,'');
			var tW = $$.css('width'),
				tH = $$.css('height');

			$$.wrap('<span style="position:relative;"></span>')
			.parent()
			.prepend('<img>')
			.find(':first-child')
			.attr('src', target)
			.attr('style', 'position:absolute;width:'+tW+';height:'+tH);

			tH = $(target).height();

			if($.browser.mozilla) {
				$$.css({
					'position' : 'absolute',
					'left' : 0,
					'background': '',
					'top' : 0
				});
			} else if($.browser.msie) {
				$$.css({
					'position' : 'absolute',
					'left' : 0,
					'background' : '',
					'top' : 14 + 'px'
				});
			} else if($.browser.opera && $.browser.version < 9.5) {
				$$.css({
					'position' : 'absolute',
					'left' : 0,
					'background' : '',
					'top' : 0
				});
			} else {
				$$.css({
					'position' : 'absolute',
					'left' : 0,
					'background' : ''
				});
			}

			$$.hover(function() {
				$$.stop().animate({
					opacity: 0
				}, 250);
			}, function() {
				$$.stop().animate({
					opacity: 1
				}, 250);
			});
		});
	};
})(jQuery);