<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
	function qx() {
		$("[name=ck]").attr("checked",true);
	}
	function qbx() {
		$("[name=ck]").attr("checked",false);
	}
	function fx(){
		$("[name=ck]").each(function(){
			$(this).attr("checked",!$(this).attr("checked"));
		})
	}
	function add() {
		location = "toAdd";
	}
	function upd(mid) {
		location = "upd.jsp?mid="+mid;
	}
	function del(mid) {
		$.post("del",{"mid":mid},function(da){
			if(da){
				alert("电影删除成功!!");
				location="selects";
			}else{
				alert("电影删除失败!!");
				location="selects";
			}
		},"json")
	}
	function plsc() {
		var mid="";
		$("[name=ck]:checked").each(function(){
			mid+= ","+this.value;
		});
		mid = mid.substring(1);
		$.post("del",{"mid":mid},function(da){
			if(da){
				alert("电影批量删除成功!!");
				location="selects";
			}else{
				alert("电影批量删除失败!!");
				location="selects";
			}
		},"json")
	}
</script>
</head>
<body>
<form action="selects" method="post">
	电影名称：<input type="text" name="mohu" value="${mohu}">
	<input type="submit" value="搜索">
	<input type="button" value="批量删除" onclick="plsc()">
</form>
<table>
	<tr>
		<td>
			<input type="button" value="全选" onclick="qx()">
			<input type="button" value="全不选" onclick="qbx()">
			<input type="button" value="反选" onclick="fx()">
		</td>
		<td>编号</td>
		<td>名称</td>
		<td>简介</td>
		<td>作者</td>
		<td>日期</td>
		<td>类型</td>
		<td>操作
			<input type="button" value="添加" onclick="add()">
		</td>
	</tr>
	<c:forEach items="${list}" var="m">
	<tr>
		<td><input type="checkbox" name="ck" value="${m.mid}"></td>
		<td>${m.mid}</td>
		<td>${m.mname}</td>
		<td>${m.area}</td>
		<td>${m.actor}</td>
		<td>${m.dates}</td>
		<td>${m.types}</td>
		<td>
			<input type="button" value="修改" onclick="upd('${m.mid}')">
			<input type="button" value="删除" onclick="del('${m.mid}')">
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="10">
			当前是第${info.pageNum}/${info.pages}页,一共${info.total}条数据
			<a href="selects?pageNum=1&mohu=${mohu}"><input type="button" value="首页"></a>
			<a href="selects?pageNum=${info.prePage}&mohu=${mohu}"><input type="button" value="上一页"></a>
			<a href="selects?pageNum=${info.nextPage}&mohu=${mohu}"><input type="button" value="下一页"></a>
			<a href="selects?pageNum=${info.pages}&mohu=${mohu}"><input type="button" value="尾页"></a>
		</td>
	</tr>
</table>
</body>
</html>