    //javascript实现页面无刷新让时间走动  
    function showTime()  
    {   
        var date = new Date();  //获取时间对象  
        var year = date.getFullYear(); //获取年  
        var month = date.getMonth()+1;//获取月份，获取的月份比真实的月份少一个月，所以这里得+1   
        var day = date.getDate();  //获取日  
        var week = date.getDay();//返回0--6，其中0表示星期天，1--6代表星期一到星期六  
        var weekStr="未知";   
        var hours = date.getHours(); //获取时（24小时制）  
        var minutes = date.getMinutes();  //获取分  
        var seconds = date.getSeconds();  //获取秒  
        var milliseconds = date.getMilliseconds();//获得毫秒   
        //当秒、分钟、小时为个位数时，在前面补0
        if(seconds<10){
        	seconds='0'+seconds;
        }
        if(minutes<10){
        	minutes='0'+minutes;
        }
        if(hours<10){
        	hours='0'+hours;
        }
        var helloMsg='';
        if(hours>=1&&hours<12){
        	helloMsg='早上';
        }else if(hours>=12&&hours<13){
        	helloMsg='中午';
        }else if(hours==24){
        	helloMsg='凌晨';
        }else if(hours>=13&&hours<=18){
        	helloMsg='下午';
        }else{
        	helloMsg='晚上';
        }
        //处理星期的显示             
        switch(week){  
                case 1:  
                    weekStr="一 "  
                break;  
                case 2:  
                    weekStr="二 "  
                break;  
                case 3:  
                    weekStr="三 "  
                break;  
                case 4:  
                    weekStr="四 "  
                break;  
                case 5:  
                    weekStr="五 "  
                break;  
                case 6:  
                    weekStr="六 "  
                break;  
                default:  
                  weekStr="日 ";  
            }             
                          
        document.getElementById("hello").innerHTML=helloMsg;                 
        document.getElementById("timeMsg").innerHTML ="今天是："+year + "年" + month + "月" + day + "日 "+"  星期"+weekStr+hours + ":" + minutes + ":" + seconds ;   
    }  
      //setInterval动作的作用是每隔一定时间就调用函数，方法或对象  
     setInterval("showTime()", 1);//设置每隔1豪秒调用一下上面的方法  