$(document).on('turbolinks:load', function() {

// モーダルの表示
  $('.glyphicon-edit').click(function() {
    $('#apply-modal').fadeIn(500);
  });

// モーダルの非表示
  $('.close-modal').click(function() {
    $('#apply-modal').fadeOut(500);
  });

});
