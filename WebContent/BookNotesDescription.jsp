<%@ page import="com.Notifier.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Main Page!!</title>
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.name {
	padding: 0px 0px 0px 0px;
	text-decoration: none;
	font-size: 25px;
	color: #f1f1f1;
	display: block;
	transition: 0.3s;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.cl {
	color: white;
	padding-left: 10px;
	padding-top: 10px;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}

.mode {
	width: 300px;
	height: 30px;
}

#fa {
	width: 40px;
	height: 9px;
}

.example {
	float: right;
}

.btm {
	padding-left: 60px;
}

#cl2 {
	float: right;
	color: white;
	margin-right: 20px;
}

#main {
	background-color: grey;
}

#des1 {
	width: 300px;
	height: 60px;
}

.display {
	background-color: white;
	border: 1px solid white;
	width: 700px;
	height: 80px;
	color: black;
	margin-bottom: 20px;
	margin-left: -20px;
	margin-right: 20px;
}

#d1 {
	float: right;
}

#uni {
	float: left;
	color: blue;
}

#uniq {
	float: right;
	margin-right: 450px;
}

#sat {
	float: left;
	margin-left: 300px;
	margin-top: -15px;
	color: black;
	text-align: center;
}

.dem {
	color: black;
}

.buttons {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
}
.btn{
	text-align:left;
}
table, th, td {
width:700px;
height:auto;
border: 1px solid black;
border-collapse: collapse;
color:black;
background-color:white;
margin-left:220px;
}
th, td {
color:black;;
background-color:white;
padding: 15px;
text-align: left;
}
#back{
	font-size:20px;
	text-decoration:none;
	color:red;
}
</style>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<%
				String name = " ";
				Cookie ck[] = request.getCookies();
				for (int i = 0; i < ck.length; i++) {
					if (ck[i].getName().equals("user")) {
						name = ck[i].getValue();
					}
				}
				System.out.println(name);
			%>
			<p class="name">
				Hai
				<%
				out.println(name);
			%>
			</p>
			<a href="NoteBookdata">NoteBooks</a> <a href="Notesdata">Notes</a> <a
				class="btn" data-toggle="modal" data-target="#myModal1">Edit
				User</a>
		</div>
		<div class='buttons'>
			<div class="cl">
				<span style="font-size: 25px; cursor: pointer" onclick="openNav()">&#9776;</span>
			</div>
			<div id="cl2">
				 <span class="cl1" style="font-size: 15px; cursor: pointer"
					onclick="ret()">LogOut</span>
			</div>
		</div>
	</div>
	<div id="main" class="container">
		<h2>Notes</h2>
		<div class="container-fluid">
			<table>
				<c:forEach var="st" items="${NotesDetailsitems}">
					<tr>
						<th>Notes Name</th>
						<td>${st.getName()}</td>
					</tr>
					<tr>
						<th>start date</th>
						<td>${st.getSdate()}</td>
					</tr>
					<tr>
						<th>End date</th>
						<td>${st.getEdate()}</td>
					</tr>
					<tr>
						<th>Remainder date</th>
						<td>${st.getRdate()}</td>
					</tr>
					<tr>
						<th>status</th>
						<td>${st.getStatus()}</td>
					</tr>
					<tr>
						<th>Tag</th>
						<td>${st.getTag()}</td>
					</tr>
					<tr>
						<th>Description</th>
						<td>${st.getDes()}</td>
					</tr>
				</c:forEach>
			</table>
			<a id="back" href="NoteBookdata">back</a>
		</div>
	</div>
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit User</h4>
				</div>
				<div class="modal-body">
					<form class="btm" action="updateData" method="post">
						First Name : <input type="text" name="firstname"
							placeholder="firstname" required> </br>
						</br> Last Name : <input type="text" name="lastname"
							placeholder="lastname" required> </br>
						</br> Password : <input type="password" placeholder="Enter Password"
							name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required> </br>
						</br>
						<button class="btn btn-success">Save</button>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "300px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "200px";
		}
		function ret() {
			location.href = "loginPage.jsp;"
		}
	</script>

</body>

</html>