$(function() {
    $('img').mousedown(
        function(e){
            e.preventDefault();
        }
    );
    $('img').mouseup(
        function(e){
            e.preventDefault();
        }
    );
    $(document).keydown(function(event){
        // クリックされたキーのコード
        var keyCode = event.keyCode;
        // Ctrlキーがクリックされたか (true or false)
        var ctrlClick = event.ctrlKey;
        // Altキーがクリックされたか (true or false)
        var altClick = event.altKey;
        // キーイベントが発生した対象のオブジェクト
        var obj = event.target;

        // ファンクションキーを制御する
        // 制限を掛けたくない場合は対象から外す
        if(keyCode == 123 ) {
            return false;
        }
    });
});
