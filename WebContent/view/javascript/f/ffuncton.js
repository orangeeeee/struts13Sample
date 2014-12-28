$(document).ready(function(){
    // 実行する処理
	var errorsString = document.getElementById('errorsString').value;

	//正規表現で無駄な文字列を除去
	errorsString = errorsString.replace(/\[|{|}|\]|/g,"");

	var errArray = errorsString.split(",");
	var errSize =errArray.length;

	var i;

	for(i=0; i < errSize; i++) {

		var errPropArray =  errArray[i].split("=");

		//必須チェックエラー
		if(errPropArray[1] === "err_req") {

			//空白を除去しないといけない
			$("#" + $.trim(errPropArray[0])).css("background-color", "#FFB1B1");
		}else if(errPropArray[1] === "err_num") {
			//数値チェックエラー

			//空白を除去しないといけない
			$("#" + $.trim(errPropArray[0])).css("background-color", "#B8FAFF");
		}else if(errPropArray[1] === "err_jp") {
			//日本語チェックエラー

			//空白を除去しないといけない
			$("#" + $.trim(errPropArray[0])).css("background-color", "#B2FFDE");
		}else if(errPropArray[1] === "err_fmt") {
			//日本語チェックエラー

			//空白を除去しないといけない
			$("#" + $.trim(errPropArray[0])).css("background-color", "#63DBFF");
		}
	}
});

$(function() {

	$('#regButton').click(function () {
		var cpath =document.getElementById('contextPath').value;
		var oFrom = document.getElementById('inputForm');
		oFrom.action = cpath + "/freg.do";
		oFrom.method ="POST";
		oFrom.submit();

	});

    $('#addButton').click(function () {

        var nextIndex = Number(document.getElementById('hKinmBeanListSize').value);
        var addPointIndx = nextIndex - 1;

      var addTags = '<tr id="addPointTr'+ nextIndex +  '">'
	      + '<td><input type="checkbox" class="delchk" id="delchkId_'+ nextIndex +  '" /></td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].pjName" value="" id="pjName_'+ nextIndex + '"></td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].team" value="" id="team_'+ nextIndex + '"></td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].time" value="" id="time_'+ nextIndex + '"></td>'
          + '</tr>'

      $('#addPointTr' + addPointIndx).after(addTags);
      document.getElementById('hKinmBeanListSize').value = nextIndex + 1;
  });

  /**
   * 削除ボタン押下処理
   */
  $('#delButton').click(function () {

      $.each($('.delchk:checked') , function(i, value) {

          var objStrArray = $(value).attr('id').split('_');
          $('#addPointTr' + objStrArray[1]).hide();
      });
  });
});
