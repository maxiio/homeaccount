 $('#myButton').on('click', function () {
    var $btn = $(this).button('loading')
    // business logic...
    $btn.button('reset')
  })

window.onload=function(){
	var time=5;
	time--;
	var second=document.getElementById("second");
	
		var timer=setInterval(function(){
			second.innerHTML=time;
			time--;
			if(time==0){
				clearInterval(timer);
				this.location="login.jsp";
			}
		},1000);
}
        
