<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html>

<head>
<title>ADMIN</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/AddCss.css">
<!-- Material Kit CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/bootstrap.min.css">
<link
	href="http://localhost:8080/CINEMA/css/material-dashboard.css?v=2.1.1"
	rel="stylesheet" />
<base>
<script type="text/javascript"
	src="http://localhost:8080/CINEMA/js/jquery.min.js"></script>
<script type="text/javascript">
  	$(document).ready(()=>{
  		$(logout).click(()=>{
  			if(confirm("Bạn có chắc muốn thoát")){
  				window.location.href = "http://localhost:8080/CINEMA/home/index.htm";
  			}
  		})
  	})
  </script>
</head>

<body>
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white">
			<!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
			<div class="logo">
				<a class="navbar-brand" href="http://localhost:8080/CINEMA/home/index/${name }.htm" style="margin-left: 20px"><img
					width="200px" src="http://localhost:8080/CINEMA/image/logo.webp"></a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link" href="#0">
							<i class="material-icons">dashboard</i>
							<p>${name}</p>
					</a></li>
					<!-- your sidebar here -->
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/CINEMA/admin/user/${name }.htm">
							<i class="material-icons">person</i>
							<p>List User</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/CINEMA/admin/movie/${name }.htm">
							<i class="material-icons">theaters</i>
							<p>List Movie</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#pablo"
								id="logout"> <i class="material-icons">power_settings_new</i>
									Logout
							</a></li>
							<!-- your navbar here -->
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<!-- your content here -->
					<table class="table table-hover">
						<tr>
							<th>Email</th>
							<th>Role</th>
							<th>FullName</th>
							<th>Phone</th>
							<th>Address</th>
							<th>BirthDay</th>
							<th></th>
						</tr>
						<c:forEach var="item" items="${users }">
							<tr>
								<td>${item.email }</td>
								<td>${item.role.name }</td>
								<td>${item.fullName }</td>
								<td>${item.phone }</td>
								<td>${item.address }</td>
								<td>${item.birthDay }</td>
								<td><a
									href="http://localhost:8080/CINEMA/admin/user/delete/${name }/${item.email }.htm">Delete</a>
									| <a
									href="http://localhost:8080/CINEMA/admin/user/editGetData/${name }/${item.email }.htm" >Edit</a></td>
							</tr>
						</c:forEach>
					</table>
					<div style="margin-left: 45%">
						<a class="nav-link" href="#" id="add"
							onclick="document.getElementById('id01').style.display='block'">
							<i class="material-icons">person_add</i> ADD
						</a>
					</div>
					<div id="id01" class="modal" style=" ${stylelogin}" >
						<form class="modal-content animate"
							action="http://localhost:8080/CINEMA/admin/user/them/${name }.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer" style="margin: 0px 0px 0px 0px !important;">
								<span
									onclick="document.getElementById('id01').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="email"><b>Email</b></label> <input type="text"
									class="form-control" placeholder="Enter Email" name="email"
									required> <label for="uname"><b>FullName</b></label> <input
									type="text" class="form-control" placeholder="Enter FullName"
									name="fullName" required> <label for="psw"><b>Password</b></label>
								<input type="password" class="form-control"
									placeholder="Enter Password" name="password" required>
								<label for="phone"><b>Phone</b></label> <input type="text"
									class="form-control" placeholder="Enter Phone" name="phone"
									required> <label for="address"><b>Address</b></label> <input
									type="text" class="form-control" placeholder="Enter Address"
									name="address" required> <label for="birthDay"><b>BirthDay</b></label>
								<input type="date" class="form-control"
									placeholder="Enter BirthDay" name="birthDay" required>
									<div style="color: red;">${message1 }</div>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Add</button>

							</div>
						</form>
					</div>
					<div id="id02" class="modal" style="${style}">
						<form class="modal-content animate"
							action="http://localhost:8080/CINEMA/admin/user/edit/${name }/${email }.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer" style="margin: 0px 0px 0px 0px !important;">
								<span
									onclick="document.getElementById('id02').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="email"><b>Email</b></label> <input type="text"
									class="form-control" placeholder="Enter Email" name="email" value="${email }"
									required> <label for="uname"><b>FullName</b></label> <input
									type="text" class="form-control" placeholder="Enter FullName"
									name="fullName" value="${fullName }" required> <label for="psw"><b>Password</b></label>
								<input type="password" class="form-control" value="${password }"
									placeholder="Enter Password" name="password" required>
								<label for="phone"><b>Phone</b></label> <input type="text" value="${phone }"
									class="form-control" placeholder="Enter Phone" name="phone"
									required> <label for="address"><b>Address</b></label> <input value="${address }"
									type="text" class="form-control" placeholder="Enter Address"
									name="address" required> <label for="birthDay"><b>BirthDay</b></label>
								<input type="date" class="form-control" value="${birthDay }"
									placeholder="Enter BirthDay" name="birthDay" required>
								<div style="color: red;">${message }</div>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Edit</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
var modal2 = document.getElementById('id02');

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal2) {
     modal.style.display = "none";
 }
}
</script>
</body>

</html>