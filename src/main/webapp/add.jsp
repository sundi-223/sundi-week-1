<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
	function add() {
		var param = $("form").serialize();
		$.post("add",param,function(da){
			if(da){
				alert("电影保存成功!!");
				location="selects";
			}else{
				alert("电影添加失败!!");
				location="toAdd";
			}
		},"json")
	}
</script>
</head>
<body>
	<form>
		名称：<input type="text" name="mname"><br><br>
		简介：<input type="text" name="area"><br><br>
		作者：<input type="text" name="actor"><br><br>
		日期：<input type="text" name="dates"><br><br>
		类型：<c:forEach items="${type}" var="t">
				<input type="checkbox" name="tids" value="${t.tid}">${t.tname}
			</c:forEach><br><br>
		<input type="button" value="添加" onclick="add()">
	</form>
</body>
</html>