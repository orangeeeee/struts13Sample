$(document).ready(function(){
    // 実行する処理
	var errorsString = document.getElementById('errorsString').value;

	//正規表現で無駄な文字列を除去
	errorsString = errorsString.replace(/\[|{|}|\]|/g,"");

	var errArray = errorsString.split(",");
	var errSize =errArray.length;

	var i;

	if(errorsString != "") {

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
			}else if(errPropArray[1] === "err_aphNum") {
				//英数チェックエラー

				//空白を除去しないといけない
				$("#" + $.trim(errPropArray[0])).css("background-color", "#B2FFDE");
			}else if(errPropArray[1] === "err_fmt") {
				//フォーマットチェックエラー

				//空白を除去しないといけない
				$("#" + $.trim(errPropArray[0])).css("background-color", "#63DBFF");
			}
			$(".error-expend-area").show();

		}
	}

    var listSize = Number(document.getElementById('hKinmBeanListSize').value);
    if(listSize === "0") {

		var nextIndex = 0;
		var addTags = '<tr id="addPointTr'+ nextIndex +  '">'
	      + '<td>'
	      + '<input type="checkbox" class="delchk" id="delchkId_'+ nextIndex +  '" />'
	      + '<input type="hidden" name="kinmBeanList['+ nextIndex +  '].chgFlg" value="" id="changeFlg_'+ nextIndex +  '">'
	      + '</td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].pjName" value="" id="pjName_'+ nextIndex + '"'
	      + ' onchange="updChangeFlg(this.id);" maxlength="50">'
	      + '</td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].team" value="" id="team_'+ nextIndex + '"'
	      + ' onchange="updChangeFlg(this.id);" maxlength="3"></td>'
	      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].time" value="" id="time_'+ nextIndex + '"'
	      + ' onchange="updChangeFlg(this.id);" maxlength="3"></td>'
          + '</tr>'

		  $('#zeroPoint').after(addTags);
		  document.getElementById('hKinmBeanListSize').value = listSize + 1;
    }
	zeroPoint
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
		      + '<td>'
		      + '<input type="checkbox" class="delchk" id="delchkId_'+ nextIndex +  '" />'
		      + '<input type="hidden" name="kinmBeanList['+ nextIndex +  '].chgFlg" value="" id="changeFlg_'+ nextIndex +  '">'
		      + '</td>'
		      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].pjName" value="" id="pjName_'+ nextIndex + '"'
		      + ' onchange="updChangeFlg(this.id);" maxlength="50">'
		      + '</td>'
		      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].team" value="" id="team_'+ nextIndex + '"'
		      + ' onchange="updChangeFlg(this.id);" maxlength="3"></td>'
		      + '<td><input type="text" name="kinmBeanList['+ nextIndex + '].time" value="" id="time_'+ nextIndex + '"'
		      + ' onchange="updChangeFlg(this.id);" maxlength="3"></td>'
	          + '</tr>'

	      $('#addPointTr' + addPointIndx).after(addTags);
	      document.getElementById('hKinmBeanListSize').value = nextIndex + 1;
  });

  /**
   * 削除ボタン押下処理
   */
  $('#delButton').click(function () {

	  var delchkArray = $('.delchk:checked');

	  if(delchkArray.length == 0) {

		  alert("ひとつ以上チェックを付けてください。");

		  return false;
	  }

      $.each(delchkArray , function(i, value) {

          var objStrArray = $(value).attr('id').split('_');
          $('#addPointTr' + objStrArray[1]).hide();
          document.getElementById('changeFlg_' + objStrArray[1]).value = "-1"
      });
  });
});

/**
 * 変更フラグ更新
 * @param idx
 */
function updChangeFlg(id_name) {

	var idx = id_name.split('_')[1];
	var changeflg = document.getElementById('changeFlg_' + idx);

	if( changeflg !="-1") {

		document.getElementById('changeFlg_' + idx).value = "1";
	}
}
