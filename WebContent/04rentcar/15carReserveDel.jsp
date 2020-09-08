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
	String id = request.getParameter("id");
	
	String rday = request.getParameter("rday");
	
	RentcarDao rdao = RentcarDao.getInstance();
	//예약 삭제 메소드 호출
	rdao.carRemoveReserve(id, rday);
	response.sendRedirect("01carMain.jsp");
	%>
</body>
</html>