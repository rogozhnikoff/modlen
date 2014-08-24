#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
$ ->
  $("form#new_user").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      alert 'Sign in by modal Succssesful'
    else
      alert('failure!')
  $("form#user_form_main").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      alert 'Sign in by main form Succssesful'
    else
      alert('failure!')