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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
	/* 	float: right; */
	display: flex;
	flex-direction: row; color : white;
	margin-right: 20px;
	color: white;
}

#main {
	background-color: lightgrey;
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
	margin-left: -10px;
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

.btn {
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

.badge {
	margin-top: -30px;
	margin-left: -10px;
	border: 1px solid white;
	border-radius: 50%;
}

.popover {
	background-color: white;
	color: black;
}

.side {
	width: 200px;
	float: left;
	height: 600px;
}

.dropdown-menu {
	position: absolute;
	left: -150px; overflow : auto;
	color: black;
	padding: 20px;
	overflow: auto; color : black; padding : 20px;
	width: 300px;
}

.btn:hover {
	color: white;
}

.content {
	display: flex;
	flex-direction: row;
	
	
}
.side {
	margin: 20px;
}
.dd{
	text-align: left;
}
.dropdown-menu {
	height: 200px;
	overflow-y: scroll;
}
.bro:hover{
	color:black;
}
.bu:hover{
	color:black;
}
.col{
	color:blue;
	text-transform:uppercase;
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
				class="btn dd" data-toggle="modal" data-target="#myModal1">Edit
				User</a>
		</div>
		<div class='buttons'>
			<div class="cl">
				<span style="font-size: 25px; cursor: pointer" onclick="openNav()">&#9776;</span>
			</div>

			<div id="cl2">
				<div class="dropdown">
					<i class="material-icons" id="list" role="button"
						data-toggle="dropdown" style="font-size: 28px; color: red">
						notifications_none </i> <span class="badge badge-light"><c:out
							value="${count}"></c:out></span>
					<div class="dropdown-menu" aria-labelledby="list">
						<p class="dropdown-items">Remainder</p>
						<hr>
						<c:forEach var="se" items="${Remainder}">
							<p class="dropdown-items" style="color: blue;">${se.getName()}</p>
							<p class="dropdown-items">Started On : ${se.getsDate()}</p>
							<p class="dropdown-items">Ended On : ${se.geteDate()}</p>
						</c:forEach>
					</div>
				</div>
				<div>
					<a href='#' class='btn' data-toggle="modal" data-target="#myModal">Add
						Notes</a> <a href='#' class="btn cl1" style="font-size: 15px;"
						onclick="ret()">LogOut</a>
				</div>
			</div>
		</div>
	</div>
	<div class='content'>
		<div class="card side">
			<div class="card-body">
				<h2>Your Tasks are!!!</h2>
				<c:forEach var="sd" items="${Remainder}">
					<p class="col">${sd.getName()}</p>
					<p>Started On: ${sd.getsDate()}</p>
					<p>Ended On: ${sd.geteDate()}</p>
				</c:forEach>
			</div>
		</div>
		<div id="main" class="container">
			<form class="example" action="#"
				style="margin: auto; max-width: 300px">
				<input class="mode" type="text" placeholder="Search.."
					name="search2">
				<button type="submit" onclick="increment()">
					<i id="fa" class="fa fa-search"></i>
				</button>
			</form>

			<h2>Notes</h2>
			<div class="container-fluid">
				<c:forEach var="st" items="${NotesListitems}">
					<div class="display">
						<a class="btn" id="uni" href="BookNoteDisplay?id=${st.getId()}">${st.getName()}</a>
						<span id="uniq">started on: ${st.getsDate()}</span>
						<button class="btn btn-primary" id="sat">${st.getStatus()}</button>
						<span id="d1"><a class="btn bu" data-toggle="modal"
							data-target="#myModal3" data-id="${st.getId()}"
							data-name="${st.getName()}" data-s="${st.getsDate()}"
							data-e="${st.geteDate()}" data-r="${st.getrDate()}"
							data-sta="${st.getStatus()}" data-ta="${st.getTag()}"
							data-d="${st.getDes()}">edit</a>/<a class="btn bro"
							data-toggle="modal" data-target="#myModal4"
							data-id1="${st.getId()}">delete</a></span><br></br>
						<details>
							<summary style="cursor: pointer">+</summary>
							<p>${st.getDes()}</p>
						</details>
					</div>
				</c:forEach>
			</div>
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
							placeholder="firstname" required> </br> </br> Last Name : <input
							type="text" name="lastname" placeholder="lastname" required>
						</br> </br> Password : <input type="password" placeholder="Enter Password"
							name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required> </br> </br>
						<button class="btn btn-success">Save</button>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Notes Details</h4>
				</div>
				<div class="modal-body">
					<form class="btm" action="BookNotes" method="post">
						Notes Name : <input type="text" name="notesName"
							placeholder="Enter name..."> </br> </br> Start Date: <input
							type="date" name="sDate" placeholder="YYYY-MM-DD"> </br> </br> End
						date : <input type="date" name="eDate" placeholder="YYYY-MM-DD">
						</br> </br> Remainder Date: <input type="date" name="rDate"
							placeholder="YYYY-MM-DD"> </br> </br> status :<select name="status">
							<option>Started</option>
							<option>Not Started</option>
						</select> </br> </br> Tag : <select name="tag">
							<option>Public</option>
							<option>Private</option>
						</select> </br> </br> Description : <input type="text" id="des1" name="des"
							placholder="Enter your description......"> </br> </br>
						<button class="btn btn-success">Save</button>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Notes Details</h4>
				</div>
				<div class="modal-body">
					<form class="btm" action="BookeditNotes" method="post">
						<p style="display: none;">
							<input type="text" name="Id" id="Nid">
						</p>
						</br> </br> Notes Name : <input type="text" name="notesName" id="Nname">
						</br> </br> Start Date: <input type="date" name="sDate" id="Nsdate">
						</br> </br> End date : <input type="date" name="eDate" id="Nedate">
						</br> </br> Remainder Date: <input type="date" name="rDate" id="Nrdate">
						</br> </br> status :<select name="status" id="Nstatus">
							<option>Started</option>
							<option>Not Started</option>
						</select> </br> </br> Tag : <select name="tag" id="Ntag">
							<option>Public</option>
							<option>Private</option>
						</select> </br> </br> Description : <input type="text" id="des1" name="des"
							class="Ndes"> </br> </br>
						<button class="btn btn-success">Save</button>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete Notes</h4>
				</div>
				<div class="modal-body">
					<form class="btm" action="BookdeleteNotes" method="post">
						<p style="display: none;">
							<input type="text" name="ID" id="NId">
						</p>
						</br> </br>
						<p>Are you sure want to delete the notes!!!</p>
						</br> </br>
						<button class="btn btn-danger">delete</button>
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
			document.getElementById("main").style.marginLeft = "100px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0px";
		}
		function ret() {
			location.href = "loginPage.jsp;"
		}
		$(".bu").click(function() {
			var I = $(this).data("id");
			var Noname = $(this).data("name");
			var SDate = $(this).data("s");
			var EDate = $(this).data("e");
			var RDate = $(this).data("r");
			var sTatus = $(this).data("sta");
			var tAg = $(this).data("ta");
			var dEs = $(this).data("d");
			$("#Nid").val(I);
			$("#Nname").val(Noname);
			$("#Nsdate").val(SDate);
			$("#Nedate").val(EDate);
			$("#Nrdate").val(RDate);
			$("#Nstatus").val(sTatus);
			$("#Ntag").val(tAg);
			$(".Ndes").val(dEs);
		});
		$(".bro").click(function() {
			var iD = $(this).data("id1");
			$("#NId").val(iD);
		});
		function increment(){
			
		}
	</script>

</body>

</html>