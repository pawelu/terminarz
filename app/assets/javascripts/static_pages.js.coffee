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
    
    if $(this).hasClass("icon-chevron-up") 
      $('#leave_all_value').html(leaveValue + 1)
    else if $(this).hasClass("icon-chevron-down") && leaveValue > 0
      $('#leave_all_value').html(leaveValue - 1)

    root.all = parseInt $('#leave_all_value').html()

# global variables
root = exports ? this
$ ->
  # in ms Date form it must be as int
  root.bar = $("#calendar").data('days').split(',')
  root.bar = root.bar.map (i) -> parseInt i 
  root.seed = $("#calendar").data('days').split(',')
  root.seed = root.seed.map (i) -> parseInt i

  root.all = parseInt $('#leave_all_value').html()



# call order:
# 
# -> render
# 
# (date select/unselect)
# -> render
# -> change

$ ->
  $('#calendar').DatePicker
    # multiple date choose
    mode: 'multiple'
    inline: true
    calendars: 3
    # first day = Monday
    starts: 1
    # preselect dates from HTML5 data attribute 
    date: root.seed

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
        alert 'p'
        root.bar = root.bar.slice(0,-1)

        $('.datepickerDisabled').each ->
          if $(this).hasClass("datepickerSelected")
            $(this).removeClass("datepickerSelected")

      # set internal calendar dates as selected by user
      $('#calendar').DatePickerSetDate(root.bar)

      days_used = root.bar.length

      days_selected = root.bar.toString()
      $('#result').html(root.bar.toString())
      $.ajax
        type: "POST"
        data:
          days_selected: days_selected
          days_used : days_used


