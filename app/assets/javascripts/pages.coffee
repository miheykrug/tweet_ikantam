# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
externalLinks = ->
  links = document.getElementsByTagName('a')
  i = 0
  while i < links.length
    link = links[i]
    if link.getAttribute('href') and link.getAttribute('rel') == 'external'
      link.target = '_blank'
    i++
  return

window.onload = externalLinks