###
  for format.js in dev env one can use coffeescript with ERB preprocessing
  but leaving off '.erb'
  so leave.js.coffee is working
  but leave.js.coffee.erb is not O_o

  for deployment (heroku) Coffeescript is not working in view .js.coffee(.erb)

  'coffeebeans' gem solves second issue
###

$ ->
  $('#leave_used_value').html(<%= @days_used %>)

  leave_used_value = parseInt $('#leave_used_value').html()
  leave_all_value = parseInt $('#leave_all_value').html()
  leave_left_value = leave_all_value - leave_used_value

  $('#leave_left_value').html(leave_left_value)
