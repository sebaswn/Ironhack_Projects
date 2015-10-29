
function fileactions(err, file){ 
    if (err) {
        console.log("error");
    }
    var episodes = JSON.parse(file);

    order_list(episodes);

   var best_episodes = filter(episodes)

    best_episodes.forEach(function(episode) {
    	show_episode(episode);
    });

}

function show_episode(episode){
	show_episode_title(episode);
	show_episode_description(episode);
	show_episode_rating(episode);
	console.log("")
}

function show_episode_title(episode){
	console.log("Title: " + episode.title + "    Episode #:" + episode.episode_number);
	
}

function show_episode_description(episode){
	console.log(episode.description);
}

function show_episode_rating(episode){
	var stars = "";
	for (var i = episode.rating; i >= 1; i--) {
		if (i > 1) {
			var stars = stars + "*";
		}
	};
	console.log("Rating: " + episode.rating + " " + stars );
}


function order_list(episodes){
	episodes.sort(function(a, b){
  	return a.episode_number - b.episode_number;
	});
}

function filter(list){
	var best_episodes = [];
	list.forEach(function(episode) {
    	if (episode.rating >= 8.5){
    		best_episodes.push(episode);
    	}
  });
  return best_episodes;
}	



module.exports = fileactions;













