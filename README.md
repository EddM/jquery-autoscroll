# jQuery Autoscroll

One of those infinite-scrolling Ajax dealies.

## Usage

Include `jquery.autoscroll.js` in your page (found in `dist/`) -- after the jQuery library, obviously. Use it like this, I guess:

    $(window).autoScroll({
			url: '/posts',
			loading: function() { 
				$("#spinner").show();
			},
			completed: function() {
				$("#spinner").hide();
			}
		});
		
## Contributing

This plugin is written in [CoffeeScript](http://coffeescript.org/). Make any changes to the `.coffee` file, then compile it into `dist/`.

    coffee --compile --output dist/ .