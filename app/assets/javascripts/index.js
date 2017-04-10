$(document).ready(function() {
    //クリックしたときのファンクションをまとめて指定
    $('.tab li').click(function() {
        //.index()を使いクリックされたタブが何番目かを調べ、
        //indexという変数に代入します。
        var index = $('.tab li').index(this);
        //コンテンツを一度すべて非表示にし、
        $('.content > li').css('display','none');
        //クリックされたタブと同じ順番のコンテンツを表示します。]
        $('.content > li').eq(index).css('display','block');
        //一度タブについているクラスselectを消し、
        $('.tab li').removeClass('select');
        //クリックされたタブのみにクラスselectをつけます。
        $(this).addClass('select')
    });
});



// $(document).ready(function(){
//   $('#tab-menu li').on('click', function(){
//     if($(this).not('active')){
//       // タブメニュー
//       $(this).addClass('active').siblings('li').removeClass('active');
//       // タブの中身
//       var index = $('#tab-menu li').index(this);
//       $('#tab-box div').eq(index).addClass('active').siblings('div').removeClass('active');
//     }
//   });
// });






window.onload = function () {
var pusher = new Pusher('ef92d3949d0199e893a6', {
      cluster: 'ap1',
      encrypted: true
    });

  var channel = pusher.subscribe('general_channel');
    channel.bind('chat_event', function(data) {
      var messagelog = document.getElementById('messagelog');
      var messagediv = document.createElement('div');
      messagediv.innerHTML = data.message;
      messagelog.appendChild(messagediv);
    });
};
