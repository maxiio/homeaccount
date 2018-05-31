<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/box.js"></script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<title>收入账单报表</title>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
	<div class="container-fluid">
		<div><select class="form-control form-inline" name="year" id="selectYear" style="width: 300px;background-color:#349BFF;color:white;font-weight: bolder;">
		    <option value="">-请选择年份-</option>
			<option>2010</option>
			<option>2011</option>
			<option>2012</option>
			<option>2013</option>
			<option>2014</option>
			<option>2015</option>
			<option>2016</option>
			<option>2017</option>
			<option>2018</option>
			<option>2019</option>
			<option>2020</option>
			<option>2021</option>
			<option>2022</option>
			<option>2023</option>
			<option>2024</option>
			<option>2025</option>
			<option>2026</option>
			<option>2027</option>
			<option>2028</option>
			<option>2029</option>
			<option>2030</option>
			<option>2031</option>
			<option>2032</option>
			<option>2033</option>
			<option>2035</option>
			<option>2036</option>
			<option>2037</option>
			<option>2038</option>
			<option>2039</option>
			<option>2040</option>
		</select>
		</div>
		<div class="row">
			<div class="col-md-6 col-xs-12"><div id="zhu"></div></div>
			<div class="col-md-6 col-xs-12"><div id="bing"></div></div>
		</div>
	</div>
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
<script>
$(function () {
	
	$.post("${pageContext.request.contextPath}/InAccountAction_findInAccountGroupByInAccountTypeName.action",{},function(data){
    	$('#bing').highcharts({
       	 chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '不同类型收入占比'
            },
            tooltip: {
                headerFormat: '{series.name}<br>',
                pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '不同收入类型占比',
                data:data
            }]
       });
    	
});
    $.post("${pageContext.request.contextPath}/InAccountAction_findInAccountGroupByInAccountTypeName.action",{},function(data){
		var arr=new Array();
    	for(var i=0;i<data.length;i++){
    		arr[i]=data[i][0];
    	}
    
    	$('#zhu').highcharts({
            title: {
                text: '收入账单报表'
            },
            subtitle :{
            	      text: '统计各类型收入总和'  
            	   },
            yAxis: {
                allowDecimals: false,
                title: {
                    text: '元',
                    rotation: 0
                }
            },
            xAxis: {
            	categories: arr
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.point.name.toLowerCase()+ '</b><br/>' +
                        this.point.y + ' 元' ;
                }
            },
            series: [{
                type: 'column',
                name:'收入账单',
                data:data
            }]
        });
    	
    });
	
	
    $("#selectYear").change(function(){
        var  year=$("#selectYear").val();
    	$.post("${pageContext.request.contextPath}/InAccountAction_findInAccountGroupByInAccountTypeName.action",{"year":year},function(data){
        	$('#bing').highcharts({
           	 chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '不同类型收入占比'
                },
                tooltip: {
                    headerFormat: '{series.name}<br>',
                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '不同收入类型占比',
                    data:data
                }]
           });
        	
    });
        $.post("${pageContext.request.contextPath}/InAccountAction_findInAccountGroupByInAccountTypeName.action",{"year":year},function(data){
    		var arr=new Array();
        	for(var i=0;i<data.length;i++){
        		arr[i]=data[i][0];
        	}
        
        	$('#zhu').highcharts({
                title: {
                    text: '收入账单报表'
                },
                subtitle :{
                	      text: '统计各类型收入总和'  
                	   },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: '元',
                        rotation: 0
                    }
                },
                xAxis: {
                	categories: arr
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.point.name.toLowerCase()+ '</b><br/>' +
                            this.point.y + ' 元' ;
                    }
                },
                series: [{
                    type: 'column',
                    name:'收入账单',
                    data:data
                }]
            });
        	
        });
    	
    })
    
    
});
</script>
</body>
</html>