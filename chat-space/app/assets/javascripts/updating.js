$(document).on('turbolinks:load', function() {
  function buildHTML(message){
      var html =
    `<div class="message__top">
        <h1>
          ${message.name}
        </h1>
        <p class="date">
          ${message.date}
        </p>
      </div>`
      if(message.text){
        var text_html =
        `<div class="message__bottom">
          <p>
            ${message.text}
          </p>
        </div>`
        html += text_html;
      } else {
        html += "<br />"
      }
      if(message.image.url) {
        var image_html =
        `<div class="image">
          <image src="${message.image.url}">
         </div>`
        html += image_html
      }
      message = $(`<div class='message' data-message-id="${message.id}">`).append(html)
      return message
    }
  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        url: location.href,
        dataType: 'json'
      })
      .done(function(json) {
        console.log('テストテストテストテストテストテスト成功')
          json.messages.forEach(function(message){
            var last_message_id = $('.right__middle').find($(".message:last-child")).attr('data-message-id');
            if(last_message_id < message.id){
              $('.right__middle').append(buildHTML(message));
            }
          })

        var position = $('.right__middle').find($(".message:last-child")).get(0).offsetTop
        $(".right__middle").not(":animated").animate({scrollTop:position});
      })
      .fail(function(data) {
        window.alert('テストテストテストテストテストテスト通信失敗')
      });
    } else {
      clearInterval(interval);
    }
  },5000); //interval
});//function
