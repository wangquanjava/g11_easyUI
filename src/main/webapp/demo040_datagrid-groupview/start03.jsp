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
	$('#tt').datagrid({
		title:'第三资方统计报表',
		width:1024,
		height:768,
		rownumbers:true,
		remoteSort:false,
		nowrap:false,
		fitColumns:true,
		url:'datagrid_data3.json',
		columns:[[
			{field:'tbThirdCapitalEntity.capitalAccount',title:'第三资方账户',width:100,sortable:true,formatter:function(value,row){
				return row.tbThirdCapitalEntity.capitalAccount;
			}},
			{field:'tbThirdCapitalEntity.maxLoanAmountDate',title:'日限额',width:80,align:'right',sortable:true,formatter:function(value,row){
				return row.tbThirdCapitalEntity.maxLoanAmountDate;
			}},
			{field:'used',title:'已放款金额',width:80,align:'right',sortable:true},
			{field:'remain',title:'剩余金额',width:80,align:'right',sortable:true},
			{field:'count',title:'笔数',width:80,align:'right',sortable:true},
			{field:'tbThirdCapitalEntity.maxSingleLoanAmount',title:'单笔最大限额',align:'right',fitColumns:true,sortable:true,formatter:function(value,row){
				return row.tbThirdCapitalEntity.maxSingleLoanAmount;
			}},
			{field:'tbThirdCapitalEntity.classifyid',title:'放款品类',width:500,align:'left',sortable:true,formatter:function(value,row){
				return row.tbThirdCapitalEntity.classifyid;
			}},
			{field:'xx',title:'种类',width:80,align:'right',sortable:true,formatter:function (value,row) {
				var type = row.tbThirdCapitalEntity.type;
				 if(type==1){
					 return "第三资方";
				 }else if(type==2){
					 return "债转渠道";
				 }
			}}
			
		]],
		//分组的类别
		groupField:'type',
		//是否激活分组
		view: groupview,
		//分组信息：value分组类别的值，rows分组元素集合
		groupFormatter:function(value, rows){
			var total = 0;
			var userd = 0;
			var remain = 0;
			
			for (var i = 0,row; row=rows[i]; i++) {
				total+=row['tbThirdCapitalEntity.maxLoanAmountDate'];
				userd+=row.userd;
				remain+=row.remain;
			}
			return formatType(rows[0]['tbThirdCapitalEntity.type'])+"：总共："+total+"，已使用："+userd+"，剩余："+remain;
		}
	});
	
})

</script>

</html>