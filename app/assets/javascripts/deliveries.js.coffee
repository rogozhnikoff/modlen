# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
deliveries = ->
  amount = $('.option-list__info_fw')
  inpAmount = $('#delivery_speed')
  $('.data-list__count .option-list__arrow-up').click (ev) ->
    ev.preventDefault()
    amount.text(parseInt(amount.text()) + 1)
    inpAmount.attr('value',amount.text())
  $('.data-list__count .option-list__arrow-down').click (ev) ->
    ev.preventDefault()
    amount.text(parseInt(amount.text()) - 1)
    inpAmount.attr('value',amount.text())
  inpAmount.attr('value',amount.text())
#deadline
  deadlineField = $('#delivery_deadline')
  $('#upperForm').change (ev) ->
    deadlineField.attr 'value', $('input[name=deadline]:checked').attr('value')
  deadlineField.attr 'value', $('input[name=deadline]:checked').attr('value')
#date
  dateField = $('#delivery_delivery_date')
  $('#inputTime').change ->
    dateField.attr 'value', $(@).val()
#submit
  $('#submit_delivery').click (ev)->
    ev.preventDefault()
    $('input[value*="Delivery"]').click()

$(document).ready(deliveries)
$(document).on('page:load', deliveries)