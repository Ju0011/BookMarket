<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Book"%>
<%@ page import = "dao.BookRepository"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());

	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	String totalPage = request.getParameter("totalPage");
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");

	Integer price;

	if (unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}

	long stock;


	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, author);
	pstmt.setString(5, publisher);
	pstmt.setString(6, description);
	pstmt.setString(7, category);
	pstmt.setLong(8, stock);
	pstmt.setString(9, totalPage);
	pstmt.setString(10, releaseDate);
	pstmt.setString(11, condition);
	pstmt.setString(12, fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	

	response.sendRedirect("books.jsp");
%>