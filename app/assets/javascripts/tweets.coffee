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

fileButton = ->
  inputs = document.querySelectorAll('.inputfile')
  Array::forEach.call inputs, (input) ->
    label = input.nextElementSibling
    labelVal = label.innerHTML
    input.addEventListener 'change', (e) ->
      fileName = ''
      if this.files and this.files.length > 1
        fileName = (this.getAttribute('data-multiple-caption') or '').replace('{count}', this.files.length)
      else
        fileName = e.target.value.split('\\').pop()
      if fileName
        label.querySelector('span').innerHTML = fileName
      else
        label.innerHTML = labelVal
      return
    return
  return
window.onload = fileButton
