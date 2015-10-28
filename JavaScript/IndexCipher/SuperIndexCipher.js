var decode = require("./IndexCipher.js");



function superDecode(sentence, behavior) {
	var behavior_array = behavior.split("-");
	var sentence_array = sentence.split(" ");
	var new_sentance_order = [];
	var sentence_to_be_decoded = [];

	if (behavior_array[1] === "backwards") { 
		new_sentance_order = sentence_array.reverse();
	}else if (behavior_array[1] === "forwards"){
		new_sentance_order = sentence_array;
	};


	if (behavior_array[0] === "every") {
		for (var i = 0; i < new_sentance_order.length; i++) {
				sentence_to_be_decoded.push(new_sentance_order[i]);
		};
	}else if (behavior_array[0] === "odd") {
		for (var i = 0; i < new_sentance_order.length; i++) {
			if (i % 2 !== 0){
				sentence_to_be_decoded.push(new_sentance_order[i]);
			};
		};
	}else if (behavior_array[0] === "even"){
		for (var i = 0; i < new_sentance_order.length; i++) {
			if (i % 2 === 0){
				sentence_to_be_decoded.push(new_sentance_order[i]);
			};
		};
	};

	var decoded_sentence =  decode(sentence_to_be_decoded);
	return decoded_sentence;
};


module.exports = superDecode;









