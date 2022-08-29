<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Bootstrap Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>  
<style type="text/css">
p{
	margin: 2px;
	padding: 2px;
}
.p1{
	width : 70%;
	float: left;
}
.p2{
	width: 25%;
	float: right;
	text-align: right;
}
input[name=reply]{
	height: 54px;
	vertical-align: top;
}
hr{
	clear: both;
}
#search{
	width: 20%;
}
.subject{
	display: inline-block;
}
.text1{
	word-spacing: 24pt;
}
.text2{
	word-spacing: 500pt;
}
</style>

<script type="text/javascript">
$(function(){
	$.ajax({
		url : '<%= request.getContextPath()%>/BoardController.do',
		type : 'get',
		data : {"gubun" : 1},
		success : function(res) {
			str = "<li class='page-item'><a class='page-link' href='#'>Previous</a></li>";
			for(var i = 1;i <= res/5; i++){
				str+="<li class='page-item'><a class='page-link' href='#'>" + i + "</a></li>"
			}
			str+="<li class='page-item'><a class='page-link' href='#'>Next</a></li>"
			$('.pagination').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
	$(document).on('click','.page-link',function(){
		boardnum = $(this).text();
		$.ajax({
			url : '<%= request.getContextPath()%>/BoardController.do',
			type : 'get',
			data : {"gubun" : 2,
				    "num"   : boardnum},
		    success : function(res){
		    	str = ""
		    	$.each(res,function(i,v){
		    		str += "<div class='card'>"
			    		str +="<div class='card-header'>"
				    	str +="<a class='collapsed card-link' data-toggle='collapse' href='#collapse"+i+"'>"
				    	str += v.subject
				    	str +="</a>"
				    	str +="</div>"
				    	str +="<div id='collapse"+i+"' class='collapse' data-parent='#accordion'>"
				    	str +="<div class='card-body'>"
					    str +="<p class='p1'>"
					    str +="작성자 : " + v.writer +"&nbsp;&nbsp;&nbsp;이메일 : " + v.mail + "&nbsp;&nbsp;&nbsp;날짜 : " + v.wdate
					    str +="&nbsp;&nbsp;&nbsp;&nbsp;조회수 : " + v.hit + "&nbsp;&nbsp;" 
					    str +="</p>"
				        str +="<p class='p2'>                                                      "
				        str +="      <input type='button' class='action' name='modify' value='수정'>"
				        str +="      <input type='button' class='action' name='delete' value='삭제'>"
				        str +="</p>                                                                "
				        str +="<hr>                                                                "
				        str +="<p class='p3'>                                                  "
				        str +=v.content
				        str +="</p>"
				    	str +="</div>"
			    	    str +="</div>"
		    	        str +="</div>"
		    	})                                                                                                
		    	//alert(str);
		    	$('#accordion').html(str);
		    },
		    error : function(xhr){
		    	alert("상태 : " + xhr.status);
		    },
		    dataType : 'json'
			
		})
		
	})
	
	$('#insertBoard').on('submit',function(){
		boardData = $('#insertBoard').serializeJSON();
		console.log(boardData);
		
		$.ajax({
			url : '<%= request.getContextPath() %>/BoardController.do',
			data : {"boardData" : boardData,
				    "gubun" : 3},
		    type : 'get',
		    success : function(res){
		    	alert(res);
		    },
		    error : function(xhr){
		    	alert("상태 : " + xhr.status);
		    },
		    dataType : 'json'
		})
		return false;
	})
	
})
</script>
</head>
<body>
	
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<form class="form-inline" id="insertBoard">
						<label for="subject" class="text1 mr-2">제 목:</label>
						<input type="text" class="form-control mr-5 w-75 mb-2" placeholder="제목" name="subject" id="subject">
						
						<label for="writer" class="text1 mr-2">이 름:</label>
						<input type="text" class="form-control mr-5 w-75 mb-2" placeholder="이름" name="writer" id="writer"><br>
						
						<label for="mail" class="text1 mr-2">메 일:</label>
						<input type="text" class="form-control mr-5 w-75 mb-2" placeholder="메일" name="mail" id="mail"><br>
						
						<label for="password" class="mr-2">비밀 번호:</label>
						<input type="text" class="form-control w-75 mb-2" placeholder="비밀번호" name="password" id="password"><br>
						
						<div class="form-row p-1">
		 	 				<label for="comment" class="mr-2">Comment: </label><hr>
		  					<textarea class="form-control mr-5" cols="90" rows="5" name="content" id="comment"></textarea>
						</div>
						
						
						<button type="submit" id="insert" class="btn btn-primary ml-3">확인</button>
					</form>
					
				</div>
			
			</div>
		</div>
	</div>		
	<div class="container" id="result">
		<button type="button" class="btn btn-outline-dark float-right" data-toggle="modal" data-target="#myModal">등록</button>
		<hr>
		<form>
		    <div id="search" class="input-group float-right">
				<div class="input-group-prepend">
					<span class="input-group-text">이름</span>
				</div>
				<input type="text" class="form-control" placeholder="Username" id="usr" name="username">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class='fas fa-search'></i></span>
				</div>
		    </div>	
		</form>
		<hr>
		<div id="accordion">
		</div>
		<hr>
		
		<ul class="pagination justify-content-center" id="page">
		
		</ul>
		
	</div>


</body>
</html>