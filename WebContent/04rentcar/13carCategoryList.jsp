<%@page import="_04rentcar.RentcarBean"%>
<%@page import="java.util.Vector"%>
<%@page import="_04rentcar.RentcarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//카테고리 분류 값 받아옴(int 타입)
	int category = Integer.parseInt(request.getParameter("category"));
	
	String temp = "";
	if (category == 1) {
		temp = "소형";
	}
	else if (category == 2) {
		temp = "중형";
	}
	else if (category == 3) {
		temp = "대형";
	}
	%>
	
	<div align = "center">
		<table>
			<tr height = "60">
				<td align = "center" colspan = "3">
					<font size = "6" color = "gray"><%=temp %> 자동차</font>
				</td>
			</tr>
			
			<%
			RentcarDao rdao = RentcarDao.getInstance();
			
			Vector <RentcarBean> v = rdao.getCategoryCar(category);
			//tr을 3개씩 보여주고, 다시 tr을 실행할 수 있도록 하는 변수 선언
			int j = 0;
			for (int i=0;i<v.size();i++) {
				RentcarBean bean = v.get(i);
				
				if (j % 3 == 0) {
					%>
					<tr height = "220">
				<% 
				}
				%>
						<td width = "333" align = "center">
						<a href = "01carMain.jsp?center=10carReserveInfo.jsp?no=<%=bean.getNo() %>">
						<img alt="" src = "img/<%=bean.getImg() %>" width = "300" height = "200">
						</a>
						<p>
						<font size = "3" color = "gray"><b>차량명 | <%=bean.getName() %></b></font>
						</td>
				<%
				//차량 정보 3개 보여주기 위해서 증가
				j++;		
			}
			%>
			</tr>
		</table>
	</div>
</body>
</html>