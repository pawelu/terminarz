# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

###
  bootstrap's tabs
###
$('#myTab a').click (e) ->
  e.preventDefault()
  $(this).tab('show')



###
  leave page
###

# leave days count setter 
$ ->
  $('i').click ->
    leaveValue = parseInt $('#leave_all_value').html() 
    
    if $(this).hasClass("icon-chevron-up") 
      $('#leave_all_value').html(leaveValue + 1)
    else if $(this).hasClass("icon-chevron-down") && leaveValue > 0
      $('#leave_all_value').html(leaveValue - 1)

    # update all global variable
    root.all = parseInt $('#leave_all_value').html()


# global variables
root = exports ? this
$ ->
  # in ms Date form array must contain ints, not strings
  root.seed = $("#calendar").data('days').split(',')
  root.seed = root.seed.map (i) -> parseInt i

  # hold leave all days count
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
    mode: 'multiple'
    inline: true
    calendars: 3
    # first day = Monday
    starts: 1
    # preselect dates from HTML5 data attribute 
    date: root.seed

    onRenderCell: (elem = "#calendar",date) ->
      # if user selects all avalible days
      if root.seed.length >= root.all
        # disable non-selected dates
        if $.inArray(date.getTime(),seed) > -1
          disabled: false
        else
          disabled: true
      # explicit hash at every execution path is required
      else
        disabled: false

    onChange: ->
      # get current selected dates ("Fri Jul 13 2012"... format)
      # into temporary array "selectedDates"
      selectedDates = $('#calendar').DatePickerGetDate()
      selectedDates = selectedDates.toString().split(',')
      # remove last element, [object HTMLDivElement]
      selectedDates = selectedDates.slice(0,selectedDates.length-1)

      # empty seed array and copy selectedDates content
      # with typecasting to int, so seed has "1342130400000" format
      root.seed.length = 0
      root.seed = seed.concat selectedDates

      # no date selected caused placing 'Invalid Date'
      # as first element of array
      if isNaN Date.parse(root.seed[0])
        root.seed.length = 0

      # info when user decrease leave day count
      # to be less than days selected count
      if root.seed.length > root.all
        alert 'Zaznaczono więcej dat niż można!\n\nProszę odznaczyć którąś datę.'

      # set internal calendar dates as selected by user
      # (essential due to render/change order)
      $('#calendar').DatePickerSetDate(root.seed)

      # prepare variables to AJAX send
      daysSelected = root.seed.toString()
      daysSelectedCount = root.seed.length

      # send to controller
      $.ajax
        type: "POST"
        data:
          daysSelected: daysSelected
          daysSelectedCount : daysSelectedCount


