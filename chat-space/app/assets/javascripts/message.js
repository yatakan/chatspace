$(document).on ('turbolinks:load', function(){
  function buildHTML(data){
    var html =
      `<div class="message__top">
          <h1>
            ${data.user_name}
          </h1>
          <p class="date">
            ${data.date}
          </p>
        </div>`
    if(data.text){
      var text_html =
      `<div class="message__bottom">
        <p>
          ${data.text}
        </p>
      </div>`
      html += text_html;
    } else {
      html += "<br />"
    }
    if(data.image.url) {
      var image_html =
      `<div class="image">
        <image src="${data.image.url}">
       </div>`
      html += image_html
    }
    message = $(`<div class='message' data-message-id="${data.id}">`).append(html)
    return message
  }
  $("#new_message").on("submit",function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href;
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.right__middle').append(message);
      $('#message_text').val('');
      $('.pic-button').val('');
      var position = $('.right__middle').find($(".message:last-child")).get(0).offsetTop
      $(".right__middle").not(":animated").animate({scrollTop:position});
    })
    .fail(function(){
      window.alert('テキストを入力するか、画像ファイルを選んでください。');
    })
    return false;
  });
});
