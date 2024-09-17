<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
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
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/Navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-4">
					<div class="card-body text-center">
						<img alt="" src="Bookimg/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row">

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="view_books.jsp?bid=<%=b.getBookid()%>"
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
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							} else {
							%>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>

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
	</div>
</body>
</html>