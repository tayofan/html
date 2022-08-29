/*
 * 
 */
 
function proc1(){
	//1 ~ 10 합
}

function proc2(){
	//1 ~ 100짝수의 합
	hap = 0;
	
	for(let i=1; i<=100; i++){
		if(i%2!=0) continue;
		hap += i;
	}
	
	//str = hap;
	
	document.querySelector("#result2").innerHTML = hap;
}

proc3 = () => {
	
	var hap = 0;
	var str = "";
	while(true){
		//입력
		su = parseInt(prompt("수를 입력"));
		//비교
		if(su == 0){
			break;
		}
		//더하고
		hap += su;
		str += su + " ";	
	}
	
	res = "입력한 값들 : " + str + "<br>";
	res += "더한 합 : " + hap;
	
	document.querySelector("#result3").innerHTML = res;
}

proc4 = () => {
	
	str ="";
	
	for(i=1;i<=10;i++){
		for(k=1;k<=10;k++){
			if((i+k) % 3 != 0) continue;
			else str += `${i} ${k} , &nbsp;&nbsp;&nbsp;`;
		}
	}
	
	document.querySelector('#result4').innerHTML = str;
}

proc5 = () => {
	
	str = "";
	
	for(i=1; i<=100;i++){
		if(/*i%2==0 && i%3==0*/ i % 6 ==0){
			str += `${i} , &nbsp;&nbsp;`;
		}
	}
	
	document.querySelector('#result5').innerHTML = str;
}

proc6 = () => {
	
	grth = "합이 100이상인 값들<br>"; //두수의 합이 100이상인 경우
	leth = "합이 100미만인 값들<br>"; //두수의 합이 100미만인 경우
	
	while(true){
		num1 = parseInt(prompt('숫자1'));
		num2 = parseInt(prompt('숫자2'));
		
		if(num1 == 0 && num2 == 0) break;
		
		if(num1+num2>=100){
			grth += `${num1} ${num2}, &nbsp;&nbsp;`;
		}else{
			leth += `${num1} ${num2}, &nbsp;&nbsp;`;
		}
	}
	
	grth += "<br>";
	leth += "<br>";
	
	document.querySelector('#result6').innerHTML = grth;
	document.querySelector('#result6').innerHTML += leth;
	
}


