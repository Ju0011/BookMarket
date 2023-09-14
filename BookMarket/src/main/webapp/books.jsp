<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dto.Book"%>
<%@ page import = "dao.BookRepository"%>
<jsp:useBean id = "productDAO" class ="dao.BookRepository" scope = "session"/>
<html>
<head>
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<title>상품목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
	BookRepository dao = BookRepository.getInstance();
	ArrayList<Book> listOfProducts = dao.getAllBooks();
	%>
	<div class="container">
		<div class= "col" align="left">
			<%@ include file="dbconn.jsp"%>
			<%
		PreparedStatement pstmt  = null;
		ResultSet rs = null;
		String sql = "select * from book";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
		%>

			<div class="col-md-4">
				<img src="c:/upload/<%=rs.getString("b_fileName")%>"
					style="width: 100%">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%>
				<p><%=rs.getString("b_UnitPrice")%>원
				<p>
					<a href="./book.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-secondary" role="button">상세정보&raquo;></a>
			</div>
			<%
			}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>