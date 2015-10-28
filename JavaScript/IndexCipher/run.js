var decode = require("./IndexCipher.js");
var superDecode = require("./SuperIndexCipher.js");





var words1 = ["dead", "bygone", "landing", "cheaply", "assumed", "incorrectly", "attention", "agent"];
var words2 = ["Intelligence", "r console", "anarchy", "drama", "four times", "hanna", "bucky", "aunts", "bangs", "anger", "yolo"];
var words3 = ["January", "lacks", "caveats", "hazardous", "DOORS", "crying","arrogantly", "climate", "proponent","rebuttal"];

// Possible decoding types:
// "every-forwards", "even-forwards", "odd-forwards"
// "every-backwards", "even-backwards", "odd-backwards"

var sentence1 = "Fill the proper tank for the cow"
var sentence2 = "Raul Nuñez call never finished"
var sentence3 = "Start rapping this or countless queasy wizards give back jay-z"
var sentence4 = "Attack her nose under here with an itch"



var message1 = decode(words1);
console.log(message1)

var message2 = decode(words2);
console.log(message2)

var message3 = decode(words3);
console.log(message3)

var message4 = superDecode(sentence1, "even-backwards");
console.log(message4)

var message5 = superDecode(sentence2, "every-forwards");
console.log(message5)

var message6 = superDecode(sentence3, "every-backwards");
console.log(message6)

var message7 = superDecode(sentence4, "every-backwards");
console.log(message7)




