# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready () ->
  counter = 1

  addPlayer = (event) ->
    event.preventDefault()
    if counter == 4
      alert "Only four players allowed!"
      return false
    player = $('#player').clone().removeAttr("id")
    $(player).children('select').after('<a href="#" class="btn btn-xs btn-danger removePlayer">Remove</a>')
    $(player).children('.removePlayer').click (event) -> removePlayer(event)
    $('#players').append(player)
    counter++
    return true

  removePlayer = (event) ->
    event.preventDefault()
    if counter == 1
      alert "At least one player is required!"
      return false
    $(event.target).parent().remove()
    counter--
    return true

  $('#addPlayer').click (event) -> addPlayer(event)
  $('a.removePlayer').click (event) -> removePlayer(event)
