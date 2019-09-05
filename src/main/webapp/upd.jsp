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
	$(function(){
		var mid="${param.mid}";
		$.post("toUpd",{"mid":mid},function(data){
			//电影对象
			var m = data.mo;
			$("[name=mname]").val(m.mname);
			$("[name=area]").val(m.area);
			$("[name=actor]").val(m.actor);
			$("[name=dates]").val(m.dates);
			//全部类型
			var t1 = data.type;
			for ( var i in t1) {
				$("span").append("<input type='checkbox' name='tids' value='"+t1[i].tid+"'>"+t1[i].tname+" ");
			}
			//已拥有类型
			var t2 = data.type1;
			for ( var i in t2) {
				$("[name=tids][value="+t2[i].tid+"]").attr("checked",true);
			}
			
		},"json")
	});
	
	function upd() {
		var param = $("form").serialize();
		$.post("upd",param,function(da){
			if(da){
				alert("电影修改成功!!");
				location="selects";
			}else{
				alert("电影修改失败!!");
				location="toUpd";
			}
		},"json")
	}
</script>
</head>
<body>
	<form>
		<input type="hidden" name="mid" value="${param.mid}"><br><br>
		名称：<input type="text" name="mname"><br><br>
		简介：<input type="text" name="area"><br><br>
		作者：<input type="text" name="actor"><br><br>
		日期：<input type="text" name="dates"><br><br>
		类型：<span></span><br><br>
		<input type="button" value="修改" onclick="upd()">
	</form>
</body>
</html>