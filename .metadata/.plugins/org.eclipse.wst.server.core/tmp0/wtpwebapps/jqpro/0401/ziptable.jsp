<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url : '<%= request.getContextPath() %>/ZipController.do',
			type : 'get',
			data : {"gubun" : 1},
			success : function(res){
				str = "";
				$.each(res,function(i,v){
					str += "<option>" + v + "</option>"
				})
				$('#sido').html(str);
				$('#sido').trigger('change');
			},
			error : function(){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
		$('#sido').on('change',function(){
			sido = $('option:selected',this).val();
			$.ajax({
				url : '<%= request.getContextPath() %>/ZipController.do',
				type : 'get',
				data : {"gubun" : 2,
					    "sido"  : sido},
			    success : function(res){
			    	str = "";
			    	$.each(res,function(i,v){
			    		str += "<option>" + v + "</option>";
			    	})
			    	$('#gugun').html(str);
			    	$('#gugun').trigger('change');
			    },
			    error : function(xhr){
			    	alert("상태 : " + xhr.status);
			    },
			    dataType : 'json'
			    

			})
		})
		
		$('#gugun').on('change',function(){
			gugun = $('option:selected',this).val();
			$.ajax({
				url : '<%= request.getContextPath() %>/ZipController.do',
				type : 'get',
				data : {"gubun" : 3,
					    "sido"  : sido,
					    "gugun" : gugun},
			    success : function(res){
			    	str = "";
			    	$.each(res,function(i,v){
			    		str += "<option>" + v + "</option>";
			    	})
			    	$('#dong').html(str);
			    },
			    error : function(xhr){
			    	alert("상태 : " + xhr.status);
			    },
			    dataType : 'json'
			})
		})
		
		$('#dong').on('change',function(){
			dong = $('option:selected',this).val();
			$.ajax({
				url : '<%= request.getContextPath() %>/ZipController.do',
				type : 'get',
				data : {"gubun" : 4,
					    "sido"  : sido,
					    "gugun" : gugun,
					    "dong"  : dong},
			    success : function(res){
			    	str = "<table border='1' class='table table-dark table-striped'>";
					str += "<tr><td>우편번호</td>";
					str += "<td>주소</td>";
					str += "<td>번지</td></tr>";
					
					$.each(res,function(i ,v){
						var bunji = v.bunji;
						if(typeof bunji == "undefined") bunji ="";
						str += "<tr class='ziptr'><td>" + v.zipcode + "</td>";
						str += "<td>" + v.sido + v.gugun + v.dong + "</td>";
						str += "<td>" + bunji + "</td></tr>";
					})
					str += "</table>";
					$('#result').html(str);
			    	
			    },
			    error : function(xhr){
			    	alert("상태 : " + xhr.status);
			    },
			    dataType : 'json'
			})
		})
	})
</script>
</head>
<body>
	<div class="container-fluid bg-primary text-white text-center p-5">
		<h1>우편번호 검색!!!!!!!</h1>
	</div>
	
	<div class="container border shadow  mt-5">
		<select id="sido" class="mb-3 mt-3"></select>
		<select id="gugun" class="mb-3 mt-3"></select>
		<select id="dong" class="mb-3 mt-3"></select>
		
		<div id="result"></div>
	
		
    </div>
</body>
</html>