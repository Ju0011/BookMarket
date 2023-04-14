<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "dto.Book"%>
<%@ page import = "dao.BookRepository"%>
<jsp:useBean id = "bookDAO" class ="dao.BookRepository" scope = "session"/>
<html>
<head>
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<title>도서 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	BookRepository dao = BookRepository.getInstance();
	Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
		<div>
		<img src="c:/upload/<%= book.getFilename() %>" style = "width : 20%"></div>
			<div class="col-md-12">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p>
					<b> 상품 코드 : </b><span class="badge badge-danger"> <%=book.getBookId()%></span>
				<p>
					<b>제조사</b> :
					<%=book.getPublisher()%>
				<p>
					<b>분류</b> :
					<%=book.getCategory()%>
				<p>
					<b>재고 수</b> :
					<%=book.getUnisInStock()%>
				<h4><%=book.getUnitPrice()%>원
				</h4>
				<p>
					<a href="#" class="btn btn-info">상품 주문 &raquo;</a> <a
						href="./book.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>