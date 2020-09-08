<%@page import="_04rentcar.RentcarBean"%>
<%@page import="java.util.Vector"%>
<%@page import="_04rentcar.RentcarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08carReserveMain.jsp</title>
</head>
<body>
	<%
	//데이터베이스에 연결하여, 최신순 자동차 3대만 뿌려주는 데이터를 가져옴
	RentcarDao rdao = RentcarDao.getInstance();
	
	//벡터를 이용하여 데이터(자동차)를 저장
	Vector<RentcarBean> v = rdao.getSelectCar();
	%>
	
	<div align = "center">
		<table>
			<tr height = "60">
				<td align = "center" colspan = "3">
					<font size = "6" color = "gray">최신형 자동차</font>
				</td>
			</tr>
			
			<tr height = "240">
				<%
				for (int i=0;i<v.size();i++) {
					RentcarBean bean = v.get(i);
					%>
					<td width = "333" align = "center">
					<a href = "01carMain.jsp?center=10carReserveInfo.jsp?no=<%=bean.getNo() %>">
						<img alt = "" src = "img/<%=bean.getImg() %>" width = "300" height = "220">
					</a>
					<p>
					차량명 : <%=bean.getName() %>
					</td>
				<% 
				} 
				%>
			</tr>	
		</table>
		
		<!-- ================================================================= -->
		
		<hr size = "3" color = "red">
		<p>
		<font size = "4" color = "gray"><b>차량 검색 하기</b></font>
		
		<form action = "01carMain.jsp?center=13carCategoryList.jsp" method = "post">
			<font size = "3" color = "gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
			<select name = "category">
				<option value = "1">소형</option>
				<option value = "2">중형</option>
				<option value = "3">대형</option>
			</select>
			<input type = "submit" value = "검색" />&nbsp;&nbsp;
		</form>
		
		<%--button은 form밖에 위치시키기 --%>
		<button onclick = "location.href='01carMain.jsp?center=09carAllList.jsp'">전체 검색</button>
	</div>
</body>
</html>