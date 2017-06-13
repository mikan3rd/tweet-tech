$(document).on('turbolinks:load', function() {

  function buildSearchHTML(user) {
    var insertImage = "";
    if (user.icon.thumb.url) {
      insertImage = '<img src="' + user.icon.thumb.url +'" class="tweet-icon">';
    }
    var html =
    '<a href="/users/' + user.id + '">' +
      '<div class="tweet-wrapper">' +
        '<div class="tweet-follow">' + '</div>' +
        insertImage +
        '<div class="tweets-nickname">' + '<h4>' + user.nickname + '</h4>' + '</div>' +
        '<div class="tweets-username">' + '<h5>@' + user.username + '</h5>' + '</div>' +
        '<div class="clear">' + '</div>' +
      '</div>'
    '</a>';
    return html;
  }

  function buildTweetHTML(tweet) {
    var insertIcon = "";
    if (tweet.icon) {
      insertIcon = '<img src="' + tweet.icon +'" class="tweet-icon">';
    }
    var insertImage = "";
    if (tweet.image) {
      insertImage = '<img src="' + tweet.image +'" class="tweet-image-border">';
    }
    var html =
    '<a href="/tweets/' + tweet.id + '">' +
      '<div class="tweet-wrapper">' +
        insertIcon +
        '<div class="tweets-nickname">' + '<h4>' + tweet.nickname + '</h4>' + '</div>' +
        '<div class="tweets-username">' + '<h5>@' + tweet.username + '</h5>' + '</div>' +
        '<p class="tweets-content">' + tweet.content + '</p>' +
        '<div class="tweets-image">' + insertImage + '</div>' +
        '<h5 class="tweets-time">' + tweet.date + '</h5>' +
      '</div>' +
    '</a>';
    return html;
  }

  function userSearch() {
    $.ajax({
      type: 'GET',
      url: '/users/search_user',
      data: {
        user: $('#user-search').val()
      },
      dataType: 'json'
    })
    .done(function(data) {
      var insertHTML = "";
      data.forEach(function(user) {
        insertHTML += buildSearchHTML(user);
      });
      $('#user-search-result').html(insertHTML);
    })
    .fail(function(data) {
      console.log("検索に失敗しました");
    });
  }

  function tweetSearch() {
    $.ajax({
      type: 'GET',
      url: '/users/search_tweet',
      data: {
        tweet: $('#tweet-search').val()
      },
      dataType: 'json'
    })
    .done(function(data) {
      var insertHTML = "";
      data.tweets.forEach(function(tweet) {
        insertHTML += buildTweetHTML(tweet);
      });
      if (!insertHTML) {
        console.log("該当しません");
      } else {
        $('#tweet-search-result').html(insertHTML);
      }
    })
    .fail(function(data) {
      console.log("検索に失敗しました");
    });
  }

  if (window.location.href.match(/search.+/)) {
    userSearch();
    tweetSearch();
  }

  $('#user-search').on('keyup', function() {
    userSearch();
  });

  $('#tweet-search').on('keyup', function() {
    tweetSearch();
  });

});
