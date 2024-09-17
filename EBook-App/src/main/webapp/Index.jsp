<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("Img/124442.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	padding-top: 50px;
	transition: background-image 1s ease-in-out;
}

.crd-ho:hover {
	background-color: #e3e3e3;
}
</style>
</head>
	<%@include file="all_component/Navbar.jsp"%>
<body style="background-color: #f7f7f7;">
	<%
  User u=(User)session.getAttribute("userobj");
	%>
	<div class="container-fluid back-img" id="backgroundImage">
		<h1 class="text-center text-Success">EBook Management System</h1>
	</div>

	<!-- Recent book started -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Bookimg/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categorie:<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>

							<%
							}
							%>
							
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View all</a>
		</div>
	</div>


	<!-- Recent book ended -->
	<hr>
	<!-- New book started -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Bookimg/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				all</a>
		</div>
	</div>

	<!-- New book ended -->
	<hr>
	<!-- Old book started -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao3.getOldBooks();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Bookimg/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				all</a>
		</div>
		</div>
		<!-- Old book ended -->

		<script>
			var images = [ "Img/124442.jpg", "Img/464322.jpg",
					"Img/1692795.jpg" ]; // Define an array of image URLs
			var currentIndex = 0; // Initialize index of current image

			function changeBackgroundImage() {
				currentIndex = (currentIndex + 1) % images.length; // Increment index (with wrapping)
				var backgroundElement = document
						.getElementById("backgroundImage");
				backgroundElement.style.backgroundImage = "url('"
						+ images[currentIndex] + "')"; // Change background image
			}

			setInterval(changeBackgroundImage, 3000); // Call changeBackgroundImage every  3seconds (3000 milliseconds)
		</script>
		<div>
			<%@include file="all_component/Footer.jsp"%>
		</div>
</body>
</html>