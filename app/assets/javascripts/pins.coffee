# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  # enable chosen js
  $('.chosen-select').chosen
    width: '200px'
    no_results_text: "Oops, nothing found!"
    allow_single_deselect: true
