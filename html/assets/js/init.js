window.addEventListener('message', function( event ) {
  if (event.data.action == 'open') {
    var type        = event.data.type;
    var userData    = event.data.array['user'][0];
    if ( type == 'fish' || type == 'fish') {
      $('#id-cardfish').css('background', 'url(assets/images/fishing.png)');
      $('#id-cardfish').show();
      $('#namefish').text(userData.firstname);
      $('#dobfish').text(userData.dateofbirth);
      $('#heightfish').text(userData.lastname);
    }
    if ( type == 'hunting' || type == 'hunting') {
      $('#id-cardhunting').css('background', 'url(assets/images/hunting.png)');
      $('#id-cardhunting').show();
      $('#namehunting').text(userData.firstname);
      $('#dobhunting').text(userData.dateofbirth);
      $('#heighthunting').text(userData.lastname);
    }
    if ( type == 'ppa' || type == 'ppa') {
      $('#id-cardppa').css('background', 'url(assets/images/ppa.png)');
      $('#id-cardppa').show();
      $('#nameppa').text(userData.firstname);
      $('#dobppa').text(userData.dateofbirth);
      $('#heightppa').text(userData.lastname);
    }
    $('#name').text(userData.firstname);
    $('#dob').text(userData.dateofbirth);
    $('#height').text(userData.lastname);
    $('#id-card').css('background', 'url(assets/images/idcard.png)');
    $('#id-card').show();
  } else if (event.data.action == 'close') {
    $('#name').text('');
    $('#dob').text('');
    $('#height').text('');
    $('#id-card').hide();
    $('#id-cardfish').hide();
    $('#id-cardhunting').hide();
    $('#id-cardppa').hide();
  }
});