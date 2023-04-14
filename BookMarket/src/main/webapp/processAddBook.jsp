<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Book"%>
<%@ page import = "dao.BookRepository"%>

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
	
	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setReleaseDate(releaseDate);
	//newBook.setTotalPage(totalPage);
	newBook.setDescription(description);
	newBook.setCategory(category);
	//newBook.setUnisInStock(unisInStock);
	newBook.setCondition(condition);
	newBook.setFilename(filename);

	dao.addBook(newBook);

	response.sendRedirect("books.jsp");
%>