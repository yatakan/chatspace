$(document).on('turbolinks:load', function(){
  var word = '';

  function appendUsers(user) {
    var html =
      `<div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.user_id}" data-user-name="${user.name}">追加</a>
      </div>`
  $("#user-search-result").append(html);
  }

  $("#user-search-field").on("keyup",function(){
    input = $("#user-search-field").val();
    var add_user_ids = []
    if ($(".chat-group-user").length!==0){
    add_user_ids.push(($(".chat-group-user")).attr($('user-id')));
    console.log(add_user_ids)
    }

    // for(var i = 0; i > $("#user-adding").find(".user-search-remove").length; i++){
    //   console.log('よばれてる？')
    // }

    if(word!==input){
      $("#user-search-result").empty();
      if(input.length!==0){
        $.ajax({
          type: 'GET',
          url: '/users',
          data: { keyword: input },
          dataType: 'json'
        })
        .done(function(users) {
          if (users.length !== 0) {
            users.forEach(function(users){
            appendUsers(users);
            });
          }
        })
        .fail(function(){
          alert('通信に失敗しました。');
        })
      }
      word = input;
    }
  })
});
