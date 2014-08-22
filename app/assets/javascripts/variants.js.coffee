# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
varPages = ->
  radio = (ev) ->
    do ev.preventDefault
    crystalRadio.removeClass 'active'
    $(@).addClass 'active'

  color_change = (ev) ->
    $('div.color-list__circle').removeClass('active')
    $(@).prev().addClass('active')

  crystalRadio = $('.option-list__link').click radio
  $('a.color-list__link').click color_change

$(document).ready(varPages)
$(document).on('page:load', varPages)