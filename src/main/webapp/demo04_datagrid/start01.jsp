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
<!-- 中文包 -->
<script type="text/javascript" src="<%=webRoot %>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js">
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('Add')">Add</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('Cut')">Cut</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">Save</a>
	</div>
	<table id="dg" class="easyui-datagrid" data-options="url:'datagrid_data.json'">
		<thead>
			<tr>
				<th data-options="field:'id'">id</th>
				<th data-options="field:'name'">name</th>
				<th data-options="field:'age'">age</th>
			</tr>
		</thead>
	</table>
	
</body>
<script type="text/javascript">
$(function() {
	$('#dg').datagrid({
		toolbar:"#tb",
		striped:true,
		pagination:true,
		loadFilter:function(data){
			return data;
		},
		rownumbers:true,
	 	sortName: 'id',
       	sortOrder: 'desc',
		//remoteSort:false
	});
})

</script>

</html>