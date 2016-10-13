<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String webRoot = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 加载默认的css样式 (包括了所有的组件)-->
<link rel="stylesheet" type="text/css" href="<%=webRoot %>/jquery-easyui-1.5/themes/default/easyui.css">
<!-- 加载icon图标样式 -->
<link rel="stylesheet" type="text/css" href="<%=webRoot %>/jquery-easyui-1.5/themes/icon.css">


<script type="text/javascript" src="<%=webRoot %>/jquery-easyui-1.5/jquery.min.js">
</script>
<!-- easyui的js -->
<script type="text/javascript" src="<%=webRoot %>/jquery-easyui-1.5/jquery.easyui.min_wangquan.js">
</script>
<script type="text/javascript" src="<%=webRoot %>/demo040_datagrid-groupview/datagrid-groupview.js">
</script>
<!-- 中文包 -->
<script type="text/javascript" src="<%=webRoot %>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js">
</script>
<title>Insert title here</title>
</head>
<body>
<table id="tt"></table>
	
</body>
<script type="text/javascript">
$(function() {
	function formatType(type) {
		 if(type==1){
			 return "第三资方";
		 }else if(type==2){
			 return "债转渠道";
		 }
	}
	
	 function formatNumber(num, precision, separator) {
		    var parts;
		    // 判断是否为数字
		    if (!isNaN(parseFloat(num)) && isFinite(num)) {
		        // 把类似 .5, 5. 之类的数据转化成0.5, 5, 为数据精度处理做准, 至于为什么
		        // 不在判断中直接写 if (!isNaN(num = parseFloat(num)) && isFinite(num))
		        // 是因为parseFloat有一个奇怪的精度问题, 比如 parseFloat(12312312.1234567119)
		        // 的值变成了 12312312.123456713
		        num = Number(num);
		        // 处理小数点位数
		        num = (typeof precision !== 'undefined' ? num.toFixed(precision) : num).toString();
		        // 分离数字的小数部分和整数部分
		        parts = num.split('.');
		        // 整数部分加[separator]分隔, 借用一个著名的正则表达式
		        parts[0] = parts[0].toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1' + (separator || ','));

		        return parts.join('.');
		    }
		    return NaN;
		}
	$('#tt').datagrid({
		title:'第三资方统计报表',
		width:1024,
		height:768,
		rownumbers:true,
		remoteSort:false,
		nowrap:false,
		fitColumns:true,
		url:'datagrid_data4.json',
		columns:[[
			{field:'tbThirdCapitalEntity.capitalAccount',title:'第三资方账户',width:100,sortable:true},
			{field:'tbThirdCapitalEntity.maxLoanAmountDate',title:'日限额',width:80,align:'right',sortable:true,formatter:function (value,row) {
				 if(value>0){
					 return formatNumber(value)
				 }else{
					 return "";
				 }
			}},
			{field:'used',title:'已放款金额',width:80,align:'right',sortable:true,formatter:function (value,row) {
				 return formatNumber(value)
			}},
			{field:'remain',title:'剩余金额',width:80,align:'right',sortable:true,formatter:function (value,row) {
				 if(value>0){
					 return formatNumber(value)
				 }else{
					 return "";
				 }
			}},
			{field:'count',title:'笔数',width:80,align:'right',sortable:true},
			{field:'tbThirdCapitalEntity.maxSingleLoanAmount',title:'单笔最大限额',align:'right',fitColumns:true,sortable:true,formatter:function (value,row) {
				 if(value>0){
					 return formatNumber(value)
				 }else{
					 return "";
				 }
			}},
			{field:'tbThirdCapitalEntity.classifyid',title:'放款品类',width:500,align:'left',sortable:true},
			{field:'tbThirdCapitalEntity.type',title:'种类',width:80,align:'right',sortable:true,formatter:function (value,row) {
				 if(value==1){
					 return "第三资方";
				 }else if(value==2){
					 return "债转渠道";
				 }
			}}
			
		]],
		//分组的类别
		groupField:'tbThirdCapitalEntity.type',
		//是否激活分组
		view: groupview,
		//分组信息：value分组类别的值，rows分组元素集合
		groupFormatter:function(value, rows){
			var total = 0;
			var userd = 0;
			var remain = 0;
			
			for (var i = 0,row; row=rows[i]; i++) {
				total+=parseInt(row['tbThirdCapitalEntity.maxLoanAmountDate']);
				userd+=parseInt(row.used);
				remain+=parseInt(row.remain);
			}
			var totalText = total==0?"":"  总共："+formatNumber(total)+"；";
			var userdText = "  已使用："+formatNumber(userd)+"；";
			var remainText = remain==0?"":"  剩余：<span class='dash'>"+formatNumber(remain)+"</span>；";
			return formatType(rows[0]['tbThirdCapitalEntity.type'])+totalText+userdText+remainText;
		}
	});
	
})

</script>
<style>
	.dash {
		color:red;
		font-size: 20px;
	}
</style>
</html>