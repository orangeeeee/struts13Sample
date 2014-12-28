

$(function() {

	$('#regButton').click(function () {
		var cpath =document.getElementById('contextPath').value;
		var oFrom = document.getElementById('inputForm');
		oFrom.action = cpath + "/freg.do";
		oFrom.method ="POST";
		oFrom.submit();

	});

    $('#addBtn').click(function () {

          var nextIndex = Number(document.getElementById('tableListSize').value);
          var addPointIndx = nextIndex - 1;

        var addTags = '<tr id="addPointTr'+ nextIndex +  '">'
            + '<td><input type="text" name="list['+ nextIndex + ']"> </td>'
            + '</tr>'

        $('#addPointTr' + addPointIndx).after(addTags);
        document.getElementById('tableListSize').value = nextIndex + 1;
    });
});
