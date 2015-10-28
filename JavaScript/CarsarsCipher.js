function caesarCipher (message, number) {
 	var message_array = message.split("");
  return message_array.map(function(letter){
  	var regular = /\w/, value_new = 0;
  	if (regular.test(letter)) {
	  	var value = (letter.charCodeAt(0)) + number;
	  		if (value < 97) {
	  			value_new = 97 - value;
	  			value = 123 - value_new;
	  		} else if (value > 122) {
	  			value_new = value - 122;
	  			value = 96 + value_new;
	  		}
	  	return String.fromCharCode(value);
	  } else { return letter };
  });
};

var encrypted = (caesarCipher("sebastian", 3)).join("");
console.log(encrypted);

var encrypted = (caesarCipher("vhedvwldq", -3)).join("");
console.log(encrypted);


