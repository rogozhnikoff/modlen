# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
varPages = ->

  color_change = (ev) ->
    $('div.color-list__circle').removeClass('active')
    $(@).prev().addClass('active')
  $('a.color-list__link').click color_change

  $('#btn_add_to_cart').click (ev) ->
    ev.preventDefault()
    $('#btn_new').click()
$(document).ready(varPages)
$(document).on('page:load', varPages)