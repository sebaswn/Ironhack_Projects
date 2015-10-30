// cd Ironhack/Week3/Day5/aGameOfRooms
var read = require('read');
"use strict"
var colors = require('colors');

var rooms = [

  { //room0
    name: "Kitchen. ",
    description: "Someone hasn't done the dishes. They have been here a long time, judging by the smell.",
    N: 4,
    E: 3,
    S: undefined,
    W: undefined,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room1
    name: "Living Room. ",
    description: "The TV is on. Oh f*ck, it's a new episode of Game Of Thrones. We better leave before we we spoil the show for ourselves.",
    N: undefined,
    E: 2,
    S: 3,
    W: 4,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room2
    name: "Walk-In Closet. ",
    description: "There are so many shoes here. Too many. Maybe we should try some on. Or maybe we should check out the weird sounds coming from the South...",
    N: undefined,
    E: undefined,
    S: 8,
    W: 1,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room3
    name: "Front Entrance. ",
    description: "Maybe we can leave ? The front door seems to be to the South. There are weird sounds coming from the East...",
    N: 1,
    E: 8,
    S: 7,
    W: 0,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room4
    name: "Play Room. ",
    description: "F*ck, just stepped on a lego. Who leaves those lying on the ground ??",
    N: 5,
    E: 1,
    S: 0,
    W: undefined,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room5
    name: "Bed Room. ",
    description: "This room is the cleanest so far. It looks like nobody has used this room in a long time.",
    N: undefined,
    E: 6,
    S: 4,
    W: undefined,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room6
    name: "Private Study. ",
    description: "There are lots of books and old typewrites on the desks. This looks like a room that would have a secret door somewhere...",
    N: undefined,
    E: undefined,
    S: undefined,
    W: 5,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: 9
  },

  { //room7
    name: "Outside. ",
    description: "It's a sunny day.",
    N: undefined,
    E: undefined,
    S: undefined,
    W: undefined,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room8
    name: "Trophy Room. ",
    description: "Lots of metal trophies, and even weirder, lots of animal heads attaches to the walls. 'Guess hunters live here.",
    N: 2,
    E: undefined,
    S: undefined,
    W: 3,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  },

  { //room9
    name: "The Secret Room. ",
    description: "There is a huge vault at the end of the room. But we aren't interested in that...",
    N: undefined,
    E: undefined,
    S: undefined,
    W: 6,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  }

  { //room10
    name: "Walk in Freezer. ",
    description: "There's an emergency button in here. It's so cold though.... We can't stay here...",
    N: undefined,
    E: 0,
    S: undefined,
    W: undefined,
    K: false,
    G: false,
    D: false,
    SW: false,
    SE: undefined
  }
]

var current = 0;

var obK = false;
var obG = false;
var obSW = false;
var obJ = false;

var turns = 0;
var difficulty = false;
var easy = false;
var bear = 8;
var sword = 5;
var gun = 9;
var key = 6;

var bear_alive = true;
var injury = false;
var time = 0;
var time_left = 5;
var randomness = false;

start(current)

function start(current) {
  console.log("");
  console.log("");
  console.log("Welcome to A Game Of Rooms !".red);
  console.log("Type ".red + "EXIT".blue + " to quit game.".red);
  console.log("Type ".red + "DROP".blue + " and the ".red + "INITIAL ".blue + "to drop object.".red);
  console.log("Your steps are being counted. Try to finish with the fewest number of moves.".red);
  console.log("Goal: Exit the house.".red);
  console.log("");
  console.log("");

  askDifficulty();
}

function askDifficulty() {
  question = {
    prompt: ">"
  }
  console.log("Would you like to play the easy version, the hard version, or the random version of this game ? (E/D/R) \n" + "Easy:".red + " the danger is confined to one room. (E) \n" + "Difficult:".red + " the danger is randomized. (D) \n" + "Random:".red + " objects AND dangers are randomized. (R)");
  read(question, setDifficulty);

  function setDifficulty(err, decision) {
    if (decision === "E") {
      easy = true;
      currentRoom(current);
    } else if (decision === "D") {
      difficulty = true;
      currentRoom(current);
    } else if (decision === "EXIT") {
      console.log("Thank you for playing.".green);
      return
    } else if (decision === "R") {
      randomness = true;
      currentRoom(current);
    } else {
      console.log("Please enter" + " E ".red + "or" + " D".red + "or" + " R".red + ".");
      askDifficulty();
    }

  }
}


function currentRoom(current) {

  if (randomness === true) {

    bear = Math.floor(Math.random() * 9);
    rooms[bear].D = true;

    key = Math.floor(Math.random() * 9);
    rooms[key].K = true;

    gun = Math.floor(Math.random() * 9);
    rooms[gun].G = true;

    sword = Math.floor(Math.random() * 9);
    rooms[sword].SW = true;

    randomness = false;
  }

  if (difficulty === true && bear_alive === true) {
    rooms[bear].D = false;
    bear = Math.floor(Math.random() * 9);
    rooms[bear].D = true;
  }

  if (easy === true) {
    rooms[gun].G = true;
    rooms[sword].SW = true;
    rooms[key].K = true;
    rooms[bear].D = true;
    easy = false
  }

  if (injury === true) {
    time++;
  }

  console.log("");
  console.log("You are in the " + (rooms[current].name).blue + (rooms[current].description));
  objectKey(current);

}


function objectKey(current) {
  if (rooms[current].K === true) {
    console.log("There is a key in this room !".magenta)
    pickUp = {

      prompt: "Would you like to pick it up ? (Y/N) \n>"

    }

    read(pickUp, objectPickUp);

    function objectPickUp(err, pickUp) {
      if (pickUp === "Y") {
        obK = true;
        rooms[current].K = false;
        console.log('You have picked it up')
        objectSword(current);
      } else if (pickUp === "EXIT") {
        console.log("Thank you for playing.".green);
        return
      } else if (pickUp === "N") {
        objectSword(current);
      } else {
        console.log("Please enter Y or N".red);
        objectKey(current);
      }

    }
  } else {
    objectSword(current);
  }
}

function objectSword(current) {
  if (rooms[current].SW === true) {
    console.log("There is a sword in this room !".magenta)
    pickUp = {
      prompt: "Would you like to pick it up ? (Y/N) \n>"

    }

    read(pickUp, weaponPickUp);

    function weaponPickUp(err, pickUp) {
      if (pickUp === "Y" && obG === false) {
        obSW = true;
        rooms[current].SW = false;
        console.log('You have picked it up');
        objectGun(current);
      } else if (pickUp === "EXIT") {
        console.log("Thank you for playing.".green);
        return
      } else if (pickUp === "Y" && obG === true) {
        console.log("You cannot pick up two weapons at the time. Please drop gun to pick up sword.".red)
        currentRoom(current);
      } else if (pickUp === "N") {
        objectGun(current);
      } else {
        console.log("Please enter Y or N".red);
        objectSword(current);
      }
    }
  } else {
    objectGun(current);
  }
}

function objectGun(current) {
  if (rooms[current].G === true) {
    console.log("There is a gun in this room !".magenta)
    pickUp = {

      prompt: "Would you like to pick it up ? (Y/N) \n>"

    }

    read(pickUp, objectPickUp);

    function objectPickUp(err, pickUp) {
      if (pickUp === "Y" && obSW === false) {
        obG = true;
        rooms[current].G = false;
        console.log('You have picked it up');
        checkIfWon(current);
      } else if (pickUp === "EXIT") {
        console.log("Thank you for playing.".green);
        return
      } else if (pickUp === "Y" && obSW === true) {
        console.log("You cannot pick up two weapons at the time. Please drop gun to pick up sword.".red)
        currentRoom(current);
      } else if (pickUp === "N") {
        checkIfWon(current);
      } else {
        console.log("Please enter Y or N".red);
        objectGun(current);
      }
    }
  } else {
    checkIfWon(current);
  }
}

function checkIfWon(current) {
  if (current === 7) {
    console.log("");
    console.log("");
    console.log("Congratulations !!".rainbow + " You have Won");
    var points = turns.toString();
    console.log("It took you " + points.red + " turns.");
    console.log("");
    tryAgain()
  } else {
    checkIfLost(current);
  }
}

function checkIfLost(current) {
  if (time === time_left) {
    console.log("You have bled out.".red)
    tryAgain();
  } else {
    checkIfBearDanger(current);
  }
}

function checkIfBearDanger(current) {
  if (rooms[current].D === true) {
    console.log("Wait... WTF IS THAT ??".red);
    console.log("Holy F*uck, there's a bear in here !!".red);

    if (obG === true) {
      console.log("BANG !!".red + "     Phew.. that was close. You just shot the bear with the gun we picked up. Lucky us".green);
      rooms[bear].D = false;
      bear_alive = false;
      input(current);
    }
    if (obSW === true) {
      console.log("SWOSH !!".red + "     Phew.. that was close. You just cut the bear with the sword we picked up. Lucky us".green);
      console.log("Unfortunately, the bear cut you too. You are bleeding to death. You have 5 turns to get out of here and get help or you will die.".red)
      rooms[bear].D = false;
      bear_alive = false;
      injury = true;
      time = 0;
      input(current);
    } else if (obG === false) {
      console.log("The bear just ate you. Too bad we didn't have a " + "weapon ".magenta + "of some sort.");
      tryAgain();
    }
  } else {
    input(current)
  }
}
function checkIfColdDanger(current){
  if(current === 10){
    if (obJ === false){
      current = rooms[current].E;
      turns++;
      currentRoom(current);
    }
  }
}

function input(current) {

  options = {

    prompt: "Which way would you like to go ?\n>"
  }

  var doors = "";

  console.log("Available doors: ");
  if (rooms[current].N != undefined) {
    doors = doors.concat("N ");
  }
  if (rooms[current].E != undefined) {
    doors = doors.concat("E ");
  }
  if (rooms[current].S != undefined) {
    doors = doors.concat("S ");
  }
  if (rooms[current].W != undefined) {
    doors = doors.concat("W ");
  }

  console.log(doors.white);

  read(options, checkIfLocked);




  function checkIfLocked(err, direction) {
    if (current === 3 && obK === false && direction === "S") {
      console.log("That door is locked. I wonder if there is a".red + " key ".magenta + "somewhere in here.".red);
      currentRoom(current);
    } else {
      checkIfDropItem(direction)
    }
  }

  function checkIfDropItem(direction) {
    if (direction === "DROP K") {
      obK = false;
      rooms[current].K = true;
      console.log("You have dropped the Key");
      currentRoom(current)
    } else if (direction === "DROP G") {
      obG = false;
      rooms[current].G = true;
      console.log("You have dropped the Gun");
      currentRoom(current)
    } else if (direction === "DROP S") {
      obSW = false;
      rooms[current].SW = true;
      console.log("You have dropped the Sword");
      currentRoom(current)
    } else {
      changeRoom(direction)
    }
  }

  function changeRoom(direction) {
    if (direction === "N" && rooms[current].N != undefined) {
      current = rooms[current].N;
      turns++;
    } else if (direction === "E" && rooms[current].E != undefined) {
      current = rooms[current].E;
      turns++;
    } else if (direction === "S" && rooms[current].S != undefined) {
      current = rooms[current].S;
      turns++;
    } else if (direction === "W" && rooms[current].W != undefined) {
      current = rooms[current].W;
      turns++;
    } else if (direction === "EXIT") {
      console.log("Thank you for playing.".green);
      return
    } else if (direction === "E" && rooms[current].SE != undefined) {
      current = rooms[current].SE;
      turns++;
    } else {
      console.log("There is no exit that way.".red);
      turns++;
    }
    currentRoom(current);
  }
}




function tryAgain() {
  ask = {
    prompt: "Would you like to try again ? (Y/N)\n>"
  }
  read(ask, reset);


  function reset(err, input) {
    if (input === "Y") {
      var current = 0;

      var obK = false;
      var obG = false;
      var obSW = false;

      var turns = 0;
      var difficulty = false;

      var bear = 8;
      var sword = 5;
      var gun = 9;
      var key = 6;

      var bear_alive = true;
      var injury = false;
      var time = 0;
      var time_left = 5;
      var randomness = false;

      var rooms = [

        { //room0
          name: "Kitchen. ",
          description: "Someone hasn't done the dishes. They have been here a long time, judging by the smell.",
          N: 4,
          E: 3,
          S: undefined,
          W: undefined,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room1
          name: "Living Room. ",
          description: "The TV is on. Oh f*ck, it's a new episode of Game Of Thrones. We better leave before we we spoil the show for ourselves.",
          N: undefined,
          E: 2,
          S: 3,
          W: 4,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room2
          name: "Walk-In Closet. ",
          description: "There are so many shoes here. Too many. Maybe we should try some on. Or maybe we should check out the weird sounds coming from the South...",
          N: undefined,
          E: undefined,
          S: 8,
          W: 1,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room3
          name: "Front Entrance. ",
          description: "Maybe we can leave ? The front door seems to be to the South. There are weird sounds coming from the East...",
          N: 1,
          E: 8,
          S: 7,
          W: 0,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room4
          name: "Play Room. ",
          description: "F*ck, just stepped on a lego. Who leaves those lying on the ground ??",
          N: 5,
          E: 1,
          S: 0,
          W: undefined,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room5
          name: "Bed Room. ",
          description: "This room is the cleanest so far. It looks like nobody has used this room in a long time.",
          N: undefined,
          E: 6,
          S: 4,
          W: undefined,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room6
          name: "Private Study. ",
          description: "There are lots of books and old typewrites on the desks. This looks like a room that would have a secret door somewhere...",
          N: undefined,
          E: undefined,
          S: undefined,
          W: 5,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: 9
        },

        { //room7
          name: "Outside. ",
          description: "It's a sunny day.",
          N: undefined,
          E: undefined,
          S: undefined,
          W: undefined,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room8
          name: "Trophy Room. ",
          description: "Lots of metal trophies, and even weirder, lots of animal heads attaches to the walls. 'Guess hunters live here.",
          N: 2,
          E: undefined,
          S: undefined,
          W: 3,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        },

        { //room9
          name: "The Secret Room. ",
          description: "There is a huge vault at the end of the room. But we aren't interested in that...",
          N: undefined,
          E: undefined,
          S: undefined,
          W: 6,
          K: false,
          G: false,
          D: false,
          SW: false,
          SE: undefined
        }
      ]
      start(current)
    } else {
      return;
    }
  }
}



