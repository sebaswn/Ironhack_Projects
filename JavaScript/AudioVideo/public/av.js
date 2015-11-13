console.log("Page has Initiated.");
var vid = document.getElementById("thisVideo");
var seconds = 0;
var timePassing = 0;
var videoLinkArrays = [];


vid.onplay = function() {
    console.log("The Counter has Started.");

    timePassing = setInterval(renderTime, 1000);
    function renderTime(){
        ++seconds;
        $('.badge').text(seconds);
    }
}
vid.onpause = function() {
    clearInterval(timePassing);
    console.log("Counter has been paused.");
}
vid.ended = function() {
    clearInterval(timePassing);
    console.log("Counter has been paused.");
}
$('#timeCounter').on('click', function(){
    seconds = 0;
    $('.badge').text(seconds);
    console.log("Counter has been reset");
});



$('#addVideo').on('click', function() {
    var video = prompt("Please enter link for a video:",
        "http://i.istockimg.com/video_passthrough/77680201/153/77680201.mp4");
    if (video !== null) {
        $('.bodyVideo').prepend(
            '<video poster="" type="video/mp4" src="' + video +
            '" class="ng-scope myVideo" controls id="thisVideo"></video><br><br>'
        );
    }

    
    saveLinks(video);

    console.log(videoLinkArrays);
    console.log("Video has been Prepended.");
    var vid = document.getElementById("thisVideo");
    vid.onplay = function() {

        console.log("Video has started playing.")

        timePassing = setInterval(renderTime, 1000);
         function renderTime(){
            ++seconds;
            $('.badge').text(seconds);
        }
    }
    vid.onpause = function() {
        console.log("Counter has been paused.")
        clearInterval(timePassing)
    }
    vid.ended = function() {
        console.log("Counter has been paused.")
        clearInterval(timePassing)
    }
});


var loadLinks = function(){
  var jsonifiedLink = JSON.parse(window.localStorage.getItem("link"));
  console.log(jsonifiedLink)

  for (i = 0; i < jsonifiedLink.length; i++) {
   
    $('.bodyVideo').prepend(
        '<video poster="" type="video/mp4" src="' + jsonifiedLink[i] +
        '" class="ng-scope myVideo" controls id="thisVideo"></video><br><br>'
    );
    saveLinks(jsonifiedLink[i]);
  }
}


var saveLinks = function(link){
  videoLinkArrays.push(link);
  console.log(videoLinkArrays);
  var stringifiedLinks = JSON.stringify(videoLinkArrays);
  console.log(stringifiedLinks);
  window.localStorage.setItem("link", stringifiedLinks);

}


loadLinks();












