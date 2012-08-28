# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# bootstrap's tabs
$('#myTab a').click (e) ->
  e.preventDefault()
  $(this).tab('show')

# leave days count setter 
$ ->
  $('i').click ->
    leaveValue = parseInt $('#leave_all_value').html() 
    root.all = parseInt $('#leave_all_value').html()
    if $(this).hasClass("icon-chevron-up") 
      $('#leave_all_value').html(leaveValue + 1)
    else if $(this).hasClass("icon-chevron-down") && leaveValue > 0
      $('#leave_all_value').html(leaveValue - 1)

# global variables
root = exports ? this
$ ->
  root.bar = $("#calendar").data('days').split(',')
  root.seed = $("#calendar").data('days').split(',')
  root.all = parseInt $('#leave_all_value').html() 

$ ->
  $('#calendar').DatePicker
    mode: 'multiple'
    inline: true
    calendars: 3
    starts: 1 
    date: seed

    onRenderCell: (elem = "#calendar",date) ->
      console.log "render"

      if root.bar.length >= root.all
        if $.inArray(date.toString(),bar) > -1 || $.inArray(date.getTime(),bar) > -1
          disabled: false
        else
          disabled: true
      else
        disabled: false

    onChange: ->
      console.log "change"
      selected_dates = $('#calendar').DatePickerGetDate()
      selected_dates = selected_dates.toString().split(',')
      selected_dates = selected_dates.slice(0,selected_dates.length-1)

      root.bar.length = 0
      root.bar = bar.concat selected_dates
      
      # no date selected caused placing 'Invalid Date'
      # as first element of array
      if isNaN Date.parse(root.bar[0])
        root.bar.length = 0

      # probably redundant
      if selected_dates.length > root.all
        root.bar = root.bar.slice(0,-1)

        $('.datepickerDisabled').each ->
          if $(this).hasClass("datepickerSelected")
            $(this).removeClass("datepickerSelected")
      $('#calendar').DatePickerSetDate(root.bar)
      console.log bar

      days_used = selected_dates.length

      selected_dates = selected_dates.toString()
      $('#result').html(selected_dates.toString())
      $.ajax
        type: "POST"
        data:
          days_selected: selected_dates
          days_used : days_used


