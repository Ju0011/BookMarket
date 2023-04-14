<%@ page contentType="text/html; charset=utf-8" %>
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
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
					Book book = listOfProducts.get(i);
			%>
			<div>
			<img src="c:/upload/<%= book.getFilename() %>" style = "width : 20%">
				<h5><strong><%=book.getName()%></strong>></h5>
				<p><%=book.getDescription()%>
				<a href = "./book.jsp?id=<%=book.getBookId() %>"
				class = "btn btn-secondary" role = "button" >상세 정보 &raquo;</a>
				
				<p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
				
				<hr>
			</div>
			<%
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>