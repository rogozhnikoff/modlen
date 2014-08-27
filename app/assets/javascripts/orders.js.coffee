# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
orders = ->
  $('.currency__text').click (ev) ->
    cur = $(@).data 'cur'
    $('input[value="'+cur+'"]').click()

$(document).ready(orders)
$(document).on('page:load', orders)