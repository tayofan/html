/**
 * 
 */
var replyList = function(target){
	//target변수는 등록버튼 또는 제목의 a태그
	$.ajax({
		url  : '/board/ReplyList.do',
		type : 'get',
		data : {
			"bonum" : actionIdx
		},
		success : function(res){
			rcode = "";
			
			$.each(res,function(i, v){
				rcode += '     <div class="rcode">';
			    rcode += '       <p class="p1">';
				rcode += '           작성자 : ' + v.name + '&nbsp;&nbsp;&nbsp;';
				rcode += '           날짜 : ' + v.redate + '&nbsp;&nbsp;&nbsp;&nbsp;';
			    rcode += '       </p>';
			    rcode += '       <p class="p2">';
			    rcode += '           <input idx="' + v.renum + '" type="button" class="action" name="modify" value="수정">';
			    rcode += '           <input idx="' + v.renum + '" type="button" class="action" name="delete" value="삭제">';
			    rcode += '       </p>';
			    rcode += '       <hr>';
			    rcode += '       <p class="p3">';
			    rcode += v.cont;	
			    rcode += '       </p>';
			    rcode += '     </div>';	
			    
			    $(target).parents('.card')
			    		 .find('.card-body')
			    		 .append(rcode);
			})
			
		},
		error : function(xhr){
			
		},
		dataType : 'json'
	})
}

var replyInsert = function(target){
	$.ajax({
		url : '/board/ReplyInsert.do',
		type : 'post',
		data : reply, //reply객체 bonum, name, cont
		success : function(res){
			alert(res.sw);
			
			//댓글 출력
			replyList(target);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	});
}
 
var boardDelete = function(){
	typeValue = $('#stype option:selected').val().trim();
	wordValue = $('#sword').val().trim();
	
	$.ajax({
		url : '/board/BoardDelete.do',
		type : 'post',
		data : {
			"page" : currentPage,
			"num"  : actionIdx,
			"type" : typeValue,
			"word" : wordValue
		},
		success : function(res){
			if(res.sw == "ok"){
				if(res.totalPage < currentPage){
					currentPage = res.totalPage;
				}
				listServer();
			}else{
				alert("삭제 실패");
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status); // 200(json데이터 jsp), 404(xml,jsp)
		},
		dataType : 'json'
	});
}
 
 var listServer = function(){
	$.ajax({
		url : '/board/List.do',
		type : 'post',
		data : {'page'  : currentPage,
				'stype' : typeValue,
				'sword' : wordValue
		},
		success : function(res) {
			str = "<div id='accordion'>";
			$.each(res.datas,function(i,v){
				str += '<div class="card">';
			    str += ' <div class="card-header">';
			    str += '     <a class="card-link" data-toggle="collapse" href="#collapse' + v.num + '">';
			    str += v.subject + '</a>';
			    str += '   </div>';
			    str += '   <div id="collapse' + v.num + '" class="collapse" data-parent="#accordion">';
			    str += '     <div class="card-body">';
			    str += '       <p class="p1">';
				str += '           작성자 : ' + v.writer + '&nbsp;&nbsp;&nbsp;';
				str += '           이메일 : ' + v.mail + '&nbsp;&nbsp;&nbsp;';
				str += '           날짜 : ' + v.wdate + '&nbsp;&nbsp;&nbsp;&nbsp;';
				str += '           조회수 : ' + v.hit + '&nbsp;&nbsp;';
			    str += '       </p>';
			    str += '       <p class="p2">';
			    str += '           <input idx="' + v.num + '" type="button" class="action" name="modify" value="수정">';
			    str += '           <input idx="' + v.num + '" type="button" class="action" name="delete" value="삭제">';
			    str += '       </p>';
			    str += '       <hr>';
			    str += '       <p class="p3">';
			    str += v.content;	
			    str += '       </p>';
			    str += '       <p class="p4">';
			    str += '       	<textarea rows="" cols="80"></textarea>';
			    str += '       	<input idx="' + v.num + '" type="button" class="action" name="reply" value="등록">';
			    str += '       </p>';
			    str += '     </div>';
			    str += '   </div>';
			    str += ' </div>';	
			})
			str += "</div>";
			$('.container').html(str);
			
			pcode = "";
			
			//이전버튼 출력
			if(res.startPage > 1){
				pcode += '<ul class="pagination">';
				pcode += '<li class="page-item">';
				pcode += '<a class="page-link prev" href="#">Previous</a>';
				pcode += '</li>';
				pcode += '</ul>';
			}
			
			//페이지 목록 출력
			pcode += '<ul class="pagination pager">';
			for(i = res.startPage; i <= res.endPage; i++){
				if(currentPage == i){
					pcode += '<li class="page-item active">';
					pcode += '<a class="page-link pnum" href="#">' + i + '</a>';
					pcode += '</li>';
				}else{
					pcode += '<li class="page-item">';
					pcode += '<a class="page-link pnum" href="#">' + i + '</a>';
					pcode += '</li>';
				}
			}
			pcode += '</ul>';
			
			//다음버튼
			if(res.endPage < res.totalPage){
				pcode += '<ul class="pagination">';
				pcode += '<li class="page-item">';
				pcode += '<a class="page-link next" href="#">Next</a>';
				pcode += '</li>';
				pcode += '</ul>';				
			}
			
			$('#pageList').html(pcode);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'	
	});	
	
}