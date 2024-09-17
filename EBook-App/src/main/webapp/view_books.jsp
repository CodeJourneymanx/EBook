<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/Navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-4">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Bookimg/<%=b.getPhotoName()%>"
					style="height: 150xp; width: 150px"><br>
				<h4 class="mt-3">
					Book Name : <span class="text-success"> <%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name : <span class="text-success"> <%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category : <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> EMail :
					<%=b.getEmail()%></h5>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="text-center p-3">
					<a href="Index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i>
						<%=b.getPrice()%></a>
				</div>
				<%
				} else {
				if (u != null) { 
				%>
				<div class="text-center p-3">
					<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>
						Add Cart</a> <a href="" class="btn btn-danger"><i
						class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="login.jsp" class="btn btn-primary"><i
						class="fa-solid fa-user"></i> Login to Add Cart</a> <a href=""
						class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i>
						<%=b.getPrice()%></a>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>