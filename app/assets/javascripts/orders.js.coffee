# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
orders = ->
  $('.currency__text').click (ev) ->
    cur = $(@).data 'cur'
    $('input[value="'+cur+'"]').click()
  $('#checkout_submit').click (ev) ->
    ev.preventDefault()
    method = $('.method-list').find('.method-list__item_active').data('class')
    if method == 'first'
      console.log('Visa')
    else if method == 'second'
      window.location =  $('#paypal_link').attr('href')
    else if method == 'third'
      console.log('Western union')
    else if method == 'forth'
      console.log('Bank')

$(document).ready(orders)
$(document).on('page:load', orders)