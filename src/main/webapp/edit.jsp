<%@page import="dao.EmployeeDao"%>
<%@page import="model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Edit Page</title>
</head>
<body>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Employee e = EmployeeDao.getEmpById(id);
%>
	
	<div class="container">
		<h1 class="text-primary mt-5">Employee Profile</h1>
		<form action="EmployeeController" method="post">
		<input type="hidden" value="<%=e.getId()%>"> 
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">First Name
				</label> <input type="text" name="fname" value="<%=e.getFname() %>" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Last Name
				</label> <input type="text" name="lname"  value="<%=e.getLname() %>" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email
				</label> <input type="email" name="email"  value="<%=e.getEmail() %>" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Mobile
				</label> <input type="text" name="contact"  value="<%=e.getMobile() %>" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Address
				</label> <input type="text" name="address"  value="<%=e.getAddress() %>" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" name="password"  value="<%=e.getPassword() %>" class="form-control"
				id="exampleInputPassword1">
		</div>
		<input type="submit" class="btn btn-primary" name="action" value="edit">
	</form>	
	</div>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>