<%@ page import="com.Notifier.*" %>
<html>
	<head>
		<title>Sign Up </title>
		<style>
			body, html {
    height: 100%;
    font-family: Arial, Helvetica, sans-serif;
  }
  
  * {
    box-sizing: border-box;
  }
  
  
  .container {
    position: relative;
    left:500px;
    top:40px;
    right: 80px;
    margin: 10px;
    width: 400px;
    padding: 16px;
    background-color: white;
  }
  input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    border: none;
    background: #f1f1f1;
  }
  
  input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
  }
  
  /* Set a style for the submit button */
  .btn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
  }
  
  .btn:hover {
    opacity: 1;
  }
		</style>
	</head>	
	<body>
		<div class="bg-img">
		    <form action="loginServlet" class="container" method="post">
		      <h1>SignUp</h1>
		      <label for="name"><b>First Name</b></label>
		      <input  type="text" placeholder="Enter name" name="fname" required>
		      
		      <label for="name"><b>Last Name</b></label>
		      <input  type="text" placeholder="Enter name" name="lname" required>
		
		      <label for="email"><b>Email</b></label>
		      <input  type="text" placeholder="Enter Email" name="email" required>
		  
		      <label for="psw"><b>Password</b></label>
		      <input  type="password" placeholder="Enter Password" name="psw" 
		      pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
		      title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
		      required>
		      <button class="btn" >Sign Up</button>
		    </form>
		</div>
	</body>
</html>
	  