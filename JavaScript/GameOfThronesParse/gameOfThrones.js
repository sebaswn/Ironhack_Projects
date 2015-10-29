var fs = require('fs');
var fileActions = require('./fileActions')

fs.readFile("./episodes.json", 'utf8', fileActions);