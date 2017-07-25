//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {

  $('#input-date').datepicker({
    startDate: new Date(),
    calendarWeeks: true,
    weekStart: 1,
    autoclose: true,
    setDate: new Date(),
    format: 'mm/dd/yyyy',
    todayHighlight: true,
    toggleActive: true
  });
});
