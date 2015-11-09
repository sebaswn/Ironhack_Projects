$('form').on('submit', function(event) {

  var userName = $('#name').val()
  var userLastName = $('#surname').val()
  var userAddress = $('#address').val()
  var userPhone = $('#phone').val()
  var userEmail = $('#email').val()

  if (userName !== "" && userLastName !== "" && userAddress !== "" && userPhone !== "" && userEmail !== "") {
    event.preventDefault();
    $('ul').append('<li class="important">' + userName + " " + userLastName + " " + userAddress + " " + userPhone + " " + userEmail + '</li>')
  } else {
    event.preventDefault();

    alert("Fill all the inputs");
  }
})