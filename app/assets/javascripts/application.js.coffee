#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
$ ->
  $("form#new_user").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      $('.popup-sign__close').click()
      $('.head__my-link u').text(data.user.email)
    else
      alert('failure!')
  $("form#user_form_main").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      $('.head__my-link u').text(data.user.email)
      $('.option-sign-in').remove()
    else
      alert('failure!')
