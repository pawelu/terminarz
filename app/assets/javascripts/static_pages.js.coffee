# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#myTab a').click (e) ->
  e.preventDefault()
  $(this).tab('show')

$ ->
  $('i').click ->
    leaveValue = parseInt $('#leave_all_value').html() 
    if $(this).hasClass("icon-chevron-up") 
      $('#leave_all_value').html(leaveValue + 1)
    else if $(this).hasClass("icon-chevron-down") && leaveValue > 0
      $('#leave_all_value').html(leaveValue - 1)

root = exports ? this
$ ->
  root.bar = $("#calendar").data('days').split(',')
  root.seed = $("#calendar").data('days').split(',')

$ ->
  $('#calendar').DatePicker
    mode: 'multiple'
    inline: true
    calendars: 3
    starts: 1 
    date: seed

    onRenderCell: (elem = "#calendar",date) ->
      console.log "render"
      # bar.push date.toString()
      if $('#leave_left_value').html() < 1
        if $.inArray(date.toString(),bar) > -1
          # console.log date.toString()
          disabled: false
        else
          disabled: true
      else
        disabled: false

    onChange: ->
      console.log root.bar
      selected_dates = $('#calendar').DatePickerGetDate()
      selected_dates = selected_dates.toString().split(',')
      selected_dates = selected_dates.slice(0,selected_dates.length-1)

      root.bar.length = 0
      root.bar = bar.concat selected_dates
      # console.log selected_dates


      days_used = selected_dates.length

      selected_dates = selected_dates.toString()
      $('#result').html(selected_dates.toString())
      $.ajax
        type: "POST"
        data:
          days_selected: selected_dates
          days_used : days_used


