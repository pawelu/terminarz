# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#myTab a').click (e) ->
  e.preventDefault()
  $(this).tab('show')

$ ->
	$('i').click ->
		leaveValue = parseInt $('#leave_value').html() 
		
		if $(this).hasClass("icon-chevron-up") 
			$('#leave_value').html(leaveValue + 1)
		else if $(this).hasClass("icon-chevron-down") && leaveValue > 0
			$('#leave_value').html(leaveValue - 1)

