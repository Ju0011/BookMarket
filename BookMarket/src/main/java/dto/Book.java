package dto;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long sericalVersionUID = -4274700572038677000L;
	
	private String bookId;	//상품 아이디
	private String name;	//상품명
	private Integer unitPrice;	//상품 가격
	private String author;	//작가
	private String description;	//상품 설명
	private String publisher;	//제조사
	private String category;		//분류
	private long unitsInStock;		//재고 수
	private long totalPage;			//페이지 수
	private String releaseDate;		//출판일(월/년)
	private String condition;	//신상품 or 중고품 or 재생품
	private String filename;	//제품 이미지 파일명 (7장 추가)
	private int quantity;	//장바구니에 담은 갯수
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnisInStock() {
		return unitsInStock;
	}

	public void setUnisInStock(long unisInStock) {
		this.unitsInStock = unisInStock;
	}

	public long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Book(String bookId, String name, Integer unitPrice) {
		super();
		this.bookId = bookId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

}