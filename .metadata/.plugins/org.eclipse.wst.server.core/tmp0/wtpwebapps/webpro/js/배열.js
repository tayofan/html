/**
 * 
 */

 
proc1 = () => {
	fr = ["사과","복숭아","딸기","바나나"]; //함수안에서 var,let안쓰면 전역변수
	// fr은 전역변수이다.
	print("#result1")	
}

proc2 = () => {
	fr = new Array("사과",100,123.456,"파인에플");
	print("#result2")	
	
	
}

proc3 = () => {
	fr = new Array(5);
	fr[0] = "사과";
	fr[1] = 100;
	fr[2] = 123.456;
	print("#result3")	
	
	
}

print = (out) => {
	str = "";
	
	for(i=0;i<fr.length;i++){
		str += fr[i] + "<br>";
	}
	
	document.querySelector(out).innerHTML = str;
}




