# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
lineItems = ->
  $('.summary__save-shopping').click (ev) ->
    ev.preventDefault()
    $('#btn_continue').click()
  $('#next_step').click (ev) ->
    ev.preventDefault()
    $('#btn_next').click()

# choose crystal types
  radio = (ev) ->
    do ev.preventDefault
    crystalRadio.removeClass 'active'
    $(@).addClass 'active'
    $('#line_item_crystal_type').attr('value', $(@).text())
    $('#btn_remote').click()

  crystalRadio = $('.option-list__link').click(radio)
# change crystal amount
  amount = $('.option-list__info_fw')
  inpAmount = $('#line_item_crystal_amount')
  $('.option-list__count .option-list__arrow-up').click (ev) ->
    ev.preventDefault()
    amount.text(parseInt(amount.text()) + 100)
    inpAmount.attr('value',amount.text())
    $('#btn_remote').click() if parseInt(amount.text()) % 500 == 0
  $('.option-list__count .option-list__arrow-down').click (ev) ->
    ev.preventDefault()
    amount.text(parseInt(amount.text()) - 100)
    inpAmount.attr('value',amount.text())
    $('#btn_remote').click() if (parseInt(amount.text())+100) % 500 == 0
#color adjust
  $('#adjustColor').change ->
    $('#line_item_colors_additions').val $(@).val()
#disabling inputs
  $('.measure-list__link').click (ev) ->
    ev.preventDefault()
    parent = $(@).parent()
    inp = parent.find('input')
    parent.find('a').removeClass('measure-list__link_active')
    $(@).addClass('measure-list__link_active')
    if $(@).find('u').text().substr(0,2) == 'No'
      inp.prop('disabled',true)
      parent.find('.item__price').addClass('item__price_strike')
      forWhat = parent.find('label').attr('for')
      $('#line_item_'+forWhat+'_present').prop('checked', false);
      $('#btn_remote').click()
    else
      parent.find('input').prop('disabled',false)
      parent.find('.item__price').removeClass('item__price_strike')
      forWhat = parent.find('label').attr('for')
      $('#line_item_'+forWhat+'_present').prop('checked', true);
      $('#btn_remote').click()
#changing params


$(document).ready(lineItems)
$(document).on('page:load', lineItems)