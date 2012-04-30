# jQuery AutoScroll
# https://github.com/EddM/jquery-autoscroll

$.fn.autoScroll = (options) ->
  
  @settings = $.extend { 
    'offset'    : 50
    'url'       : ''
    'loading'   : -> null
    'completed' : -> null
    'page'      : 1
  }, options
  
  @current_page = @settings.page
  @paging = false
  
  $(this).scroll =>
    if !@paging && $(this).scrollTop() >= ($(document).height() - ($(this).height() + @settings.offset))
      @paging = true
      @settings.loading()
      $.ajax @settings.url,
        dataType: 'js'
        data:
          page: @current_page + 1
        success: => @current_page += 1,
        complete: => 
          @paging = false
          @settings.completed()