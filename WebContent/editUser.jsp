<html>

<head>
<title>Edit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.container{
	border:1px solid black;
	width:400px;
	height:250px;
	margin-left:350px;
	margin-top:100px;
	padding-top:20px;
}

</style>
</head>
<body>
	<div class="container">
		<form action="#" method="post">
			First Name : <input type="text" name="firstname" placeholder="firstname" required>
			</br></br>
			Last Name : <input type="text" name="lastname" placeholder="lastname" required>
			</br></br>
			email : <input type="text" name="email" placeholder="email" required>
			</br></br>
			Password : <input  type="password" placeholder="Enter Password" name="psw" 
		      pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
		      title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
		      required>
		      </br></br>
		      <button class="btn btn-success">Save</button>
		</form>
	
	</div>

</body>
</html>




