$(document).on ('turbolinks:load', function(){
  var word

  function appendUsers(user) {
    var html =
      `<div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.user_id}" data-user-name="${user.name}">追加</a>
      </div>`
  $("#user-search-result").append(html);
  }

  function appendNoUsers(text) {
   var html =
      `<li>
        ${text}
      </li>`
  $("#user-search-result").append(html);
  }

  $("#user-search-field").on("keyup",function(){
    input = $("#user-search-field").val();

    if(word!==input&&input.length!==0){
      console.log('IF文')
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(users) {
        $("#user-search-result").empty();
        $("#user-adding").empty();
        if (users.length !== 0) {
          console.log('成功');
          users.forEach(function(users){
          appendUsers(users)
          });
        } else {
          console.log('一致しないパターン');
        }
      })
      .fail(function(){
        console.log('通信に失敗');
      })
    }
    word = input
  }) //keyup
}); //ハッカ葉
