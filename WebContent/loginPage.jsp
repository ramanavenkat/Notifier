<html>

<head>
<title>Login Page</title>
<style>
	body, html {
    height: 100%;
    font-family: Arial, Helvetica, sans-serif;
    position: relative;
    top:10px;
  }
  
  * {
    box-sizing: border-box;
  }
 .container {
    position: absolute;
    top:40px;
    right: 80px;
    margin: 20px;
   	width:400px;
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
  .bg-img{
  	margin-right: 400px;
  }
  input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
  }
  .btn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    border: none;
    cursor: pointer;
    width:200px;
    position: relative;
    left:80px;
    opacity: 0.9;
  }
  .btn:hover {
    opacity: 1;
  }
  h3{
  	position:relative;
  	left:20px;
  }
	
</style>
</head>
<body>
<div class="bg-img container">
	<h3>Remind Me</h3>	
    <form  class="container" action="loginSetup" method="post">
      <h2>Login</h2>
  
      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>
  
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw"  required>
  
      <button  class="btn" >Login</button>
      <p>Need to Create Account? <a href="signupPage.jsp">SignUp</a></p>
    </form>
</div>
  
	
</body>
</html>