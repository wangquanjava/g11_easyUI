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
	$('#tt').datagrid({
		title:'DataGrid - GroupView',
		width:500,
		height:250,
		rownumbers:true,
		remoteSort:false,
		nowrap:false,
		fitColumns:true,
		url:'datagrid_data.json',
		columns:[[
			{field:'productid',title:'Product ID',width:100,sortable:true},
			{field:'listprice',title:'List Price',width:80,align:'right',sortable:true},
			{field:'unitcost',title:'Unit Cost',width:80,align:'right',sortable:true},
			{field:'attr1',title:'Attribute',width:150,sortable:true},
			{field:'status',title:'Status',width:60,align:'center'}
		]],
		groupField:'productid',
		view: groupview,
		groupFormatter:function(value, rows){
			return value + ' - ' + rows.length + ' Item(s)';
		}
	});
})

</script>

</html>