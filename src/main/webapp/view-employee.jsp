<%@page import="dao.EmployeeDao"%>
<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>View Employee</title>
</head>
<body>
	<% 
		List<Employee> list = EmployeeDao.showEmployee();
	%>
	<div class="container">
		<h1 class="text-primary mt-4">List Of Employee</h1>
		<table class="table table-striped table-hover mt-5">
			<thead>
				<tr>
					<th scope="col">Emp_Id</th>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">Mobile</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>

			<tbody>
			<% for(Employee e: list){ %>
				<tr>
					<th scope="row"><%=e.getId() %></th>
					<td><%=e.getFname() %></td>
					<td><%=e.getLname() %></td>
					<td><%=e.getEmail() %></td>
					<td><%=e.getMobile() %></td>
					<td><a href="edit.jsp?id=<%=e.getId() %>"
						class="btn btn-primary">Edit</a></td>
					<td><a href="delete.jsp?id=<%=e.getId() %>"
						class="btn btn-danger">Delete</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<h2 class="text-center mt-3">
			<a href="add-employee.jsp">Add Employee</a>
		</h2>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>