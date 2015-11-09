// Write your Pizza Builder JavaScript in this file.

$(document).on('ready', function() {
  $('.sauce-white').toggle();
  $('.crust-gluten-free').toggle();
  $(".glutP").toggle();
  $(".whiteP").toggle();
})

var pressedPep = true;
var pressedMush = true;
var pressedGreen = true;
var pressedWhite = false;
var pressedCrust = false;
var total = 13;

$('.btn-pepperonni').on('click', function() {
  	$('.pep').toggle();

  	if(pressedPep === true){
  		$(".btn-pepperonni").removeClass("active");
  		pressedPep = false;
  		
  		total = total - 1;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".pepP").toggle();
  	}else{
  		$(".btn-pepperonni").addClass("active");
  		pressedPep = true;
  		
  		total = total + 1;
  		$('.total').empty();
  		$('.total').text(total + "$");
  		$(".pepP").toggle();
  	}

})


$('.btn-mushrooms').on('click', function() {
  $('.mushroom').toggle();

  if(pressedMush === true){
  		$(".btn-mushrooms").removeClass("active");
  		pressedMush = false;

  		total = total - 1;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".mushP").toggle();
  	}else{
  		$(".btn-mushrooms").addClass("active");
  		pressedMush = true;

  		total = total + 1;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".mushP").toggle();
  	}
})

$('.btn-green-peppers').on('click', function() {
  $('.green-pepper').toggle();

  if(pressedGreen === true){
  		$(".btn-green-peppers").removeClass("active");
  		pressedGreen = false;

  		total = total - 1;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".greenP").toggle();
  	}else{
  		$(".btn-green-peppers").addClass("active");
  		pressedGreen = true;

  		total = total + 1;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".greenP").toggle();
  	}
})

$('.btn-sauce').on('click', function() {
  $('.sauce-white').toggle();

  if(pressedWhite === true){
  		$(".btn-sauce").removeClass("active");
  		pressedWhite = false;

  		total = total - 3;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".whiteP").toggle();
  	}else{
  		$(".btn-sauce").addClass("active");
  		pressedWhite = true;

  		total = total + 3;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".whiteP").toggle();
  	}
})

$('.btn-crust').on('click', function() {
  $('.crust-gluten-free').toggle();

  if(pressedCrust === true){
  		$(".btn-crust").removeClass("active");
  		pressedCrust = false;

  		total = total - 5;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".glutP").toggle();
  	}else{
  		$(".btn-crust").addClass("active");
  		pressedCrust = true;

  		total = total + 5;
  		$(".total").empty();
  		$(".total").text(total + "$");
  		$(".glutP").toggle();
  	}
})




