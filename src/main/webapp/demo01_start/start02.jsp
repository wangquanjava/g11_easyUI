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
<!-- 
	这里实现了第一个面板
	总结：
	   1.id没啥用
	   2.class用来标注这个div的样式
	   3.style用来调整这个div的位置
	   5.data-option：把这个面板的属性都写到里面
 -->
<input class="easyui-combobox" name="language"
    data-options="
    url:'combobox_data.json',
    valueField:'id',
    textField:'text',
    panelHeight:'auto',
    onSelect:function(record){
    alert(record.text)
    }">


</body>
</html>