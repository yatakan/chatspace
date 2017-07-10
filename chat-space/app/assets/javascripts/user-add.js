$(document).on ('turbolinks:load', function(){
  function buildHTML(user_id, user_name) {
    html =
    `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
      <input name='group[user_ids][]' type='hidden' value='${user_id}'>
      <p class='chat-group-user__name'>${user_name}</p>
      <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' user_id="${user_id}" user_name="${user_name}">削除</a>
    </div>`
    return html
  }

  $("#user-search-result").on("click",".user-search-add",function() {
    var user_id = $(this).attr('data-user-id');
    var user_name = $(this).attr('data-user-name');
    $(this).parent().remove();
    buildHTML(user_id, user_name);
    $('#user-adding').append(html);
  });

  $("#user-adding").on("click",".user-search-remove",function() {
    $(this).parent().remove();
  });
});
