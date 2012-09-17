# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on 'click', '.yes-no', (event)-> 
  event.preventDefault()
  if $(this).text() == "TAK" 
    $(this).text("NIE")
  else if $(this).text() == "NIE"
    $(this).text("TAK")
  id = $(this).attr('id')
  $.post('/tasks/' + id + '/toggle')

$(document).on 'click', '#button-done', (event)->
  event.preventDefault()
  $('#tasks_done_table').toggle 'slow', ->

$ ->
  tasks_not_done_count = $('#tasks_done_table table tbody').children().length
  $('#button-done').html("Pokaż/Ukryj zadania wykonane (" + tasks_not_done_count + ")" )
  $('#tasks_done_table').hide()

  # to remove date
  $("form").on 'click', '.remove_date', (event)->
    event.preventDefault()
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
