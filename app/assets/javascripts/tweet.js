$(document).on('turbolinks:load', function() {

  function buildHTML(data, i) {
    var icon = data.list[i].weather[0].icon;
    console.log(icon);
    var html =
    '<div>' +
      '<h3>'+ data.list[i].weather[0].main + '</h3>' +
      '<img src="http://openweathermap.org/img/w/' + icon + '.png">'
    '</div>';
    return html
  }

// モーダルの表示
  $('.glyphicon-edit').click(function() {
    $('#apply-modal').fadeIn(500);
  });

// モーダルの非表示
  $('.close-modal').click(function() {
    $('#apply-modal').fadeOut(500);
  });

  $(function() {
    var API_KEY = 'fda68f66e84fff8b5ffc4133f261f8a9'
    var city = 'Tokyo';
    var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&APPID=' + API_KEY;
    $.ajax({
      url: url,
      dataType: "json",
      type: 'GET',
    })
    .done(function(data) {
      var insertHTML = "";
      $('#city-name').text(data.city.name);
      for (var i = 0; i <= 5; i++) {
        insertHTML += buildHTML(data, i);
      }
      $('#weather').html(insertHTML);
    })
    .fail(function(data) {
      console.log("失敗しました");
    });
  });
});
