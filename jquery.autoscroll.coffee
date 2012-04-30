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
  
  @currentPage = @settings.page
  @paging = false
  @lastScrollPos = 0
  
  @scrollingDown = => $(this).scrollTop() > @lastScrollPos
  
  $(this).scroll =>
    scrollingDown = @scrollingDown()
    @lastScrollPos = $(this).scrollTop()
    if !@paging && scrollingDown && $(this).scrollTop() >= ($(document).height() - ($(this).height() + @settings.offset))
      @paging = true
      @settings.loading()
      $.ajax @settings.url,
        dataType: 'js'
        data:
          page: @currentPage + 1
        success: => @currentPage += 1,
        complete: => 
          @paging = false
          @settings.completed()