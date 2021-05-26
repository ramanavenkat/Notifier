<%@ page import="com.Notifier.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
<meta name="viewport" content= "width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity=
"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous">
    </script>
      
    <script src=
"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity=
"sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous">
    </script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	.name{
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
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
	.cl{
		color:white;
		padding-left:10px;
		padding-top:10px;
		
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
.mode{
	width:300px;
	height:30px;
}
#fa{
	width:40px;
	height:9px;
}
.example{
	float:right;
}
.btm{
	padding-left:60px;
}

#cl2 {
	float: right;
	color: white;
	margin-right: 20px;
}

#main {
	background-color: lightgrey;
}
.display{
	width:700px;
	height:50px;
	border:1px solid white;
	background-color:white;
	color:black;
	margin-right:200px;
}
#d1{
	float:right;
	
}
#co{
	font-size:10px;
	text-decoration:none;
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
.buy:hover{
	color:black;
}
</style>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div id="mySidenav" class="sidenav">
 			 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			 <%
			 	String name=" ";
			 	Cookie ck[] = request.getCookies();
				for(int i=0;i<ck.length;i++){
					if(ck[i].getName().equals("user")){
						name=ck[i].getValue();
					}
				}
				System.out.println(name);
			 %>
			 <p class="name">Hai <% out.println(name); %></p>
  			 <a href="NoteBookdata">NoteBooks</a>
  			 <a href="Notesdata">Notes</a>
			 <a class="btn"  data-toggle="modal" data-target="#myModal2">Edit User</a>
		</div>
		<div class='buttons'>
			<div class="cl">
				<span style="font-size: 25px; cursor: pointer" onclick="openNav()">&#9776;</span>
			</div>
			<div id="cl2">
				<span class="btn" data-toggle="modal" data-target="#myModal1">Add
					NoteBook</span> <span class="cl1" style="font-size: 15px; cursor: pointer"
					onclick="ret()">LogOut</span>
			</div>
		</div>
	</div>
	<div id="main" class="container">
		<form class="example" action="#" style="margin:auto;max-width:300px">
 			 <input class="mode" type="text" placeholder="Search.." name="search2">
  			 <button type="submit"><i id="fa" class="fa fa-search"></i></button>
		</form>
		<h2>NoteBooks</h2>
		<div class="container">
			<c:forEach var="st" items="${NoteBookList}">
				<p class="display">
					<a class="btn" href="NoteBooknote?id=${st.getId2()}">${st.getS1()}</a>
					<span id="d1"><a class="btn buy"  data-toggle="modal" data-target="#myModal" data-id="${st.getId2()}" data-name="${st.getS1()}">edit</a>/<a class="btn bro" data-toggle="modal" data-target="#myModal3" data-id1="${st.getId2()}">delete</a></span></br>
					<a id="co">${st.getCount()} Notes</a>
				</p>
			</c:forEach>
		</div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
    	<div class="modal-dialog">
      	<!-- Modal content-->
      	  <div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Edit User</h4>
        	</div>
        	<div class="modal-body">
          		<form class="btm" action="updateData" method="post">
					First Name : <input type="text" name="firstname" placeholder="firstname" required>
					</br></br>
					Last Name : <input type="text" name="lastname" placeholder="lastname" required>
					</br></br>
					Password : <input  type="password" placeholder="Enter Password" name="psw" 
		      			pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
		      			title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
		      			required>
		      		</br></br>
		      		<button class="btn btn-success">Save</button>
				</form>
             <div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	</div>
      	 </div>
    	</div>
  	</div>
  	</div>
  	<div class="modal fade" id="myModal1" role="dialog">
    	<div class="modal-dialog">
      	<!-- Modal content-->
      	  <div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Add NoteBook Name</h4>
        	</div>
        	<div class="modal-body">
          		<form class="btm" action="NoteBook" method="post">
					Add NotesBookName : <input type="text" name="bookName" placeholder="Enter name...">
		      		</br></br>
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
          		<h4 class="modal-title">Add NoteBook Name</h4>
        	</div>
        	<div class="modal-body">
          		<form class="btm" action="editNoteBook" method="post">
          			Add NotesBookName : <input type="text" name="bookName" id="brother" value="">
          			</br></br>
          			<p style="display:none;"><input type="text" name="noteBookId" id="bookId" value=""></p>
		      		</br></br>
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
          		<h4 class="modal-title">Delete NoteBook..</h4>
        	</div>
        	<div class="modal-body">
          		<form class="btm" action="deleteNoteBook" method="post">
          			<p style="display:none;"><input type="text" name="notBookId" id="bokId" value=""></p>
          			<p>Are you sure want to delete the NoteBook</p>
		      		<button class="btn btn-danger">Delete</button>
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
		  document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
		  document.getElementById("mySidenav").style.width = "0";
		  document.getElementById("main").style.marginLeft= "100px";
		}
		function ret(){
			location.href="loginPage.jsp;"
		}
		$(".buy").click(function () {
			var id=$(this).data("id");
			var name=$(this).data("name");
			$("#brother").val(name);
			$("#bookId").val(id);
		});
		$(".bro").click(function(){
			var id7=$(this).data("id1");
			$("#bokId").val(id7);
		})
	</script>

</body>

</html>