function searchArtists(event) {
    event.preventDefault();
    var search = $('.search').val();
    search = search.replace(/\s/g, "%20");
    var request = $.get("https://api.spotify.com/v1/search?type=artist&query=" + search);
    $('.media').empty();
    $('.trackMedia').empty();
    function handleArtists(artist) {

            for(i = 0, len = artist.artists.items.length; i < len; i++){
              var html = ['<div class="media-left">',
                          '<a href="#" class="linkToAlbum"  dataArtistID="' + artist.artists.items[i].id + '">',
                          '<img class="media-object" src="' + artist.artists.items[i].images[artist.artists.items[i].images.length - 1].url + '"  alt="..." style="width:65px;height:65px;">',
                          '</a>',
                          '</div>',
                          '<div class="media-body">',
                          '<h4 class="media-heading">'+ artist.artists.items[i].name + '</h4>' + '<b>' + "Popularity: " + '</b>' + artist.artists.items[i].popularity + '<b>', '<br>', "Followers: " + '</b>' + artist.artists.items[i].followers.total +
                          '</div>',
                          '</div>',
                          '<br>'
                ].join('\n');

                $('.artistMedia').append(html);
            }
  
    }
    request.done(handleArtists);
}

function searchAlbums(event){
  event.preventDefault();
  var artistID = $(this).attr('dataArtistID')

  var request = $.get('https://api.spotify.com/v1/artists/' + artistID +'/albums' );
  $('.albumMedia').empty();
  $('.trackMedia').empty();

  function handleAlbums(albums){
    for(i = 0, len = albums.items.length; i < len; i++){
                var html = ['<div class="media-left">',
                            '<a href="#" class="linkToTrack" dataAlbumID="' + albums.items[i].id + '">',
                            '<img class="media-object" src="' + albums.items[i].images[albums.items[i].images.length - 1].url + '"  alt="..." style="width:65px;height:65px;">',
                            '</a>',
                            '</div>',
                            '<div class="media-body">',
                            '<h4 class="media-heading">'+ albums.items[i].name + '</h4>' + '<b>' + "Type: " + '</b>' + albums.items[i].type +
                            '</div>',
                            '</div>',
                            '<br>'
                  ].join('\n');

                  $('.albumMedia').append(html);
              }   
  }
  request.done(handleAlbums);
}






function searchTracks(event){
  event.preventDefault();
  var albumID = $(this).attr('dataAlbumID')

  var request = $.get('https://api.spotify.com/v1/albums/' + albumID +'/tracks' );
  $('.trackMedia').empty();

  function handleTracks(tracks){
    for(i = 0, len = tracks.items.length; i < len; i++){
                var html = [
                      '<li>',
                      '<h4>' + tracks.items[i].name + '</h4>',
                      '<dl>',
                      '<b>',
                      "Track #:",
                      '</b>',
                       + tracks.items[i].track_number +
                      '</li>'
                  ].join('\n');

                  $('.trackMedia').append(html);
              }   
  }
  request.done(handleTracks);
}







$(document.body).on('click','.js-search', searchArtists);
$(document.body).on('click','.linkToAlbum', searchAlbums);
$(document.body).on('click','.linkToTrack', searchTracks);













