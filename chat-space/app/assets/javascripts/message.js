$(document).on('ready page:load' , function() {
  function buildHTMLtop(data){
    var html =
      `<div class="message">
        <div class="message__top">
          <h1>
            ${data.user_name}
          </h1>
          <p class="date">
            ${data.date}
          </p>
        </div>
      </div>`
      return html;
  }
  function buildHTMLbottom(data){
    var bottom_html = ""
    if(data.text){
      var data_text = data.text;
      var text_html =
      `<div class="message__bottom">
        <p>
          ${data.text}
        </p>
      </div>`
      bottom_html += text_html;
    }
    if(data.image.url) {
      var image_html = `<image src="${data.image.url}">`
      bottom_html += image_html
    }
    return bottom_html
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
      var html = buildHTMLtop(data);
      var bottom_html = buildHTMLbottom(data);
      $('.right__middle').append(html);
      $('.message:last-child').append(bottom_html);
      $('#message_text').val('');
      $('.pic-button').val('');
      var position = $('.right__middle').find($(".message:last-child")).get(0).offsetTop
      $(".right__middle").not(":animated").animate({scrollTop:position});
    })
    .fail(function(){
      window.alert('テキストが入力されていません');
    })
    return false;
  });
});
