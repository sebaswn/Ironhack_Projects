$('.add-button').on('click', function() {
  var userInput = $('input').val()
  $('ul').append('<li class="normal">' + userInput + '</li>')
  $('input').val('')
})

$('.add-important-button').on('click', function() {
  var userInput = $('input').val()
  $('ul').append('<li class="important">' + userInput + '</li>')
  $('input').val('')
})

$('.show-important-button').on('click', function() {
  $('.normal').toggle();
})