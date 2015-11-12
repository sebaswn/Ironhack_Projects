// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Descriptions: http://pokeapi.co/api/v1/description/5/

window.PokemonApp = {};

PokemonApp.Pokemon = function(uri) {
	this.id = PokemonApp.idFromUri(uri);
};

PokemonApp.renderDetails = function(data, details){
	$('.titleSpan').text(data.name);
	$('.modal-title small').text(data.pkdx_id);

	details.empty();
	details.append($('<dt>').text('Height'));

	details.append($('<dd>').text(data.height));
	details.append($('<dt>').text('Weight'));
	details.append($('<dd>').text(data.weight));
	details.append($('<dt>').text('HP'));
	details.append($('<dd>').text(data.hp));
	details.append($('<dt>').text('Attack'));
	details.append($('<dd>').text(data.attack));
	details.append($('<dt>').text('Defense'));
	details.append($('<dd>').text(data.defense));
	details.append($('<dt>').text('Description:'));
}

PokemonApp.renderDescription = function(data, details){
	description_uri = data.descriptions[0].resource_uri;
	$.ajax({
						
		url: "http://pokeapi.co"+description_uri,
		success: function(data){
			details.append($('<dd>').text(data.description));

		}
	})
}


PokemonApp.renderImage = function(data){
	$('.image').empty()
	$('.image').append('<img src="http://img.pokemondb.net/artwork/'+ data.name.toLowerCase() +'.jpg">')
}

PokemonApp.renderTypes = function(data, details){
	
	details.append($('<dt>').text('Types:'));
	details.append($('<dd>').text('Water'))
	
	
}



PokemonApp.Pokemon.prototype.render = function(){
	console.log("Displaying pokeome with ID" + this.id);

	$.ajax({
		url: '/api/pokemon/' + this.id,
		success: function(data){
			var details = $('.modal-body dl');
			
			$('.spanButton').empty();
			PokemonApp.renderDetails(data, details);
			
			PokemonApp.renderDescription(data, details);
			PokemonApp.renderImage(data);

			if(data.evolutions[0]){
				$('.spanButton').append('<button class="btn btn-primary evolutions" data-pokemon-uri="'+ data.evolutions[0].resource_uri +'">Show Next Evolution </button>')
			}

			$('.pokemon-modal').modal('show');

			$('.evolutions').click(function(){
				var uri = $(this).data('pokemon-uri');

				var pokemon = new PokemonApp.Pokemon(uri);
				pokemon.render();
			})
		}
	});
};



PokemonApp.idFromUri = function(uri){
	var parts = uri.split('/');
	var id = parts[parts.length - 2];
	return id;
};

$(document).ready(function(){
	$('.evolutions').show();

	$('.js-show-pokemon').click(function(){
		var uri = $(this).data('pokemon-uri');

		var pokemon = new PokemonApp.Pokemon(uri);
		pokemon.render();
	})
})















