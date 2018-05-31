//适合从---到---格式的
$(document).ready(function(){
		 //日期控件
		$("#date_start").prop("readonly", true).datepicker({
		    changeMonth: true,
		    dateFormat: "yy-mm-dd",
		    onClose: function(selectedDate) {
		        $("#date_end").datepicker("option", "minDate", selectedDate);
		    }
		});
		  $("#date_end").prop("readonly", true).datepicker({
	          changeMonth: true,
	          dateFormat: "yy-mm-dd",
	          onClose: function(selectedDate) {
	              $("#date_start").datepicker("option", "maxDate", selectedDate);
	              $("#date_end").val($(this).val());
	          }
	      });
	});
//文本框选择日期时间
$(document).ready(function(){
	 //日期控件
	$("#date").prop("readonly", true).datepicker({
	    changeMonth: true,
	    dateFormat: "yy-mm-dd",
	    onClose: function(selectedDate) {
	       
	    }
	});
    $('#datetime').prop("readonly", true).timepicker({
        timeText: '时间',
        hourText: '小时',
        minuteText: '分钟',
        secondText: '秒',
        currentText: '现在',
        closeText: '完成',
        showSecond: true, //显示秒  
        timeFormat: 'HH:mm:ss' //格式化时间  
    });
 
});
//文本框选择日期
$(document).ready(function(){
	 //日期控件
	$("#birthday").prop("readonly", true).datepicker({
	    changeMonth: true,
	    dateFormat: "yy-mm-dd",
	    onClose: function(selectedDate) {
	       
	    }
	});
 
});