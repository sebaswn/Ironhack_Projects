function onSubmit(event) {
  event.preventDefault();
  console.debug('SUBMITTED');
  var newCharacter = {
    name: $('.name').val(),
    occupation: $('.occupation').val(),
    weapon: $('.weapon').val()
  }

  var request = $.post('https://ironhack-characters.herokuapp.com/characters', newCharacter);

  function onSaveSuccess(response) {
    console.debug('BOOM', response);
  }

  function onSaveFailure(err) {
    console.error(err.responseJSON);
  }

  request.done(onSaveSuccess);
  request.fail(onSaveFailure);
}

$('.js-submit').on('click', onSubmit);

function fetchCharacters() {
  var request = $.get('https://ironhack-characters.herokuapp.com/characters');

  function handleCharacters(characters) {
    characters.forEach(function appendLi(chr) {
      var html = [
        '<li>',
        '<h2>' + chr.name + '</h2>',
        '<dl>',
        '<dt>Occupation:</dt>',
        '<dd>' + chr.occupation + '</dd>',

        '<dt>Weapon:</dt>',
        '<dd>' + chr.weapon + '</dd>',

        '<dt>Debt:</dt>',
        '<dd>' + chr.debt + '</dd>',
        '</dl>',
        '</li>'

        // Join the array by newline to make a giant string
      ].join('\n');

      // Append giant HTML to list
      $('.js-character-list').append(html);
    });
  }

  function handleError(err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  request.done(handleCharacters);
  request.fail(handleError);
}

$('.js-characters').on('click', fetchCharacters);