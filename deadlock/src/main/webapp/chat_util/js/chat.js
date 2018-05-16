
	//시간 설정
	var interval = 500;
	
	//마지막으로 읽어온 시간을 저장, 그 값을 토대로 읽어오기 위함
	var finalDate = "";
	
	//계속해서 시간이 초기화 되는 것 방지
	var timeFlag = true;
	
	//DB의 변화를 캐치하기 위한 변수
	var table_cnt = 0;
	
	var res;
	
var chatManager = new function(){
	
	this.time_Get = function(){
		
		if(!timeFlag){
			chatManager.check();
			return false;
		}else{
			timeFlag = false;
			
			$.post(
				"chat_time",
				"",
				function(data,textStatus){

					finalDate = data.realtime;
					chatManager.check();
				}
			)
		}
	}
	
	this.check = function(){
		
		$.post(
			"chat_check",
			"table_cnt="+table_cnt+"&chat_index=${dto.chat_index}",
			function(data,textStatus){
				
				if(data.flag == true){
					
					table_cnt = data.count;
					chatManager.show();
				}
			}
		)
	}
	
	this.show = function(){
		
		if(table_cnt == 0){
			return false;
		}
		
		$.post(
			"chat_show",
			"table_cnt="+table_cnt+"&chat_index=${dto.chat_index}&finalDate="+finalDate,
			function(data,textStatus){
				res = data;
				showme = data;
				
				if(data.cflag == true){
					chatManager.chat_print();
				}
			}
		)
	}
	
	this.chat_print = function(){
		var o = document.getElementById("list");
		var dt, dd;
		// 채팅내용 추가 하기
			for(var i=0; i<showme.size; i++){
				
				dt = document.createElement("dt");
				dt.appendChild(document.createTextNode(res.list[i].nickname));
				o.appendChild(dt);
				
				dd = document.createElement("dd");
				dd.appendChild(document.createTextNode(res.list[i].chat_content));
				o.appendChild(dd);
		
			}
		//스크롤 가장 아래로 내리기
		o.scrollTop = o.scrollHeight;
		timeFlag = true;
		chatManager.time_Get();
	}
	
	
	//채팅 내용 및 닉네임을 입력후 서브밋을 하면 누르게 되면, 비동기 통신
	this.write = function(frm) {
		//폼 내의 input 태그 값을 가져오기 위함
		//비동기 통신 요청시 parameter로 보내준다.
		var param = $("#Please_chat").serialize();
		
		//비동기 통신과 동시에 DB에 채팅 내용을 저장한다.
		$.post(
			"chat_write",
			param,
			function(data, textStatus){
				//alert(textStatus);
				
				//JSON data값을 받아온다.				
// 				var result = eval("("+data+")");
				//채팅 내용 비워주기
				$("#msg").val("");
				//채팅내용 갱신을 위한 메소드 호출
// 				chatManager.check();
			}
		)//post close
		
	}//write close
	
	//정해둔 시간마다 호출
	setInterval(this.time_Get, interval);
	
}//chatManager close