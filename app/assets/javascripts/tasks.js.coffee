# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $('.btn-info').on "click", ->
    console.log(event.type)
    if $(this).text() == "TAK" 
      $(this).text("NIE")
    else if $(this).text() == "NIE"
      $(this).text("TAK")
    id = $(this).attr('id')
    $.post('/tasks/' + id + '/toggle')