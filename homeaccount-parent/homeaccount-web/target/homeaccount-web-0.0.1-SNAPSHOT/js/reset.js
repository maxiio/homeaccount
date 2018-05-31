//导航菜单--设置鼠标滑过
$(function () {
    $(".dropdown").mouseover(function () {
        $(this).addClass("open");
    });

    $(".dropdown").mouseleave(function(){
        $(this).removeClass("open");
    })

})
// 日期控件
 $('#outaccounttime').datetimepicker({
		 	 	pickerPosition: 'up-right',
		 	 	format: 'yyyy-mm-dd ',
	            language:  'zh-CN',  
	            weekStart: 1,  
	            todayBtn:  1,  
	            autoclose: 1,  
	            todayHighlight: 1,  
	            startView: 2,  
	            minView: 2,  
	            forceParse: 0  
           });  