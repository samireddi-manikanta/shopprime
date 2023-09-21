
<%@ page import="java.sql.*"%>

<%

String item=request.getParameter("search");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("select * from Products where category=? or name=? ");
    ps.setString(1,item);
    ps.setString(2,item);
    ResultSet x=ps.executeQuery();
  

%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<link href="https://fonts.googleapis.com/css2?family=Audiowide&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Berkshire+Swash&display=swap" rel="stylesheet">
<link rel="stylesheet" href="styles.css">

<style>
  .header{
    font-family:'kalam';
    color: honeydew;
  }
  .quote {
    box-shadow: 0px 4px 8px 14px rgba(2, 44, 56, 0.842);
    background-color: deeppink;
    width: 90%;
    height: 40%;
    padding-top: 2%;
    padding-left: 4%;
    padding-bottom: 4%;
    margin: 4%;
  }
  .quote p{
    
    font-size: 40px;
    font-weight: bold;
    font-family: 'Audiowide', cursive;
    color:whitesmoke;
    width:80%;
  }
  .header{
    font-family: 'Berkshire Swash', cursive;
  }
  body{
    background-image: url("shop.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
  }
  .offer img{
    width: 95%;
    max-height: 20%;
    margin-left: 2%;
    margin-right: 2%;
  }
  .toppicks{
    color:ghostwhite;
    padding-left: 2%;
    margin: 2%;
  }
  .topnav form button{
  float: right;
  background-color: rgb(226, 141, 13);
  border: none;
  color: white;
  padding: 7px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin-top: 8px;
  margin-right: 6px;
  cursor: pointer;
  border-radius: 2px;
  }

 

</style>
</head>
<body>
  <div class="header">
    <center><h1>Shop prime</h1></center>
  </div>

<div class="topnav">
  <a class="active" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home</a>
  <a href="electronics.html">Electronics</a> 
  <a href="fashion.html">Fashion</a>
  <a href="sports.html">Sports</a>
  <a href="about.html">About Us</a>
  <form action="registration.html">
    <button>SIGN UP</button>
  </form>
  <div class="search-container">
    <form action="search.jsp">
      <input type="text" placeholder="Search.." name="search">
      
     <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>
<br>
<%while(x.next()){%>
 
  <div class="column">
    <div class="card">
      <img src=<%=x.getString(3)%> style="width: 75%;height: 75%;">
      <h3><%=x.getString(2)%></h3>
      <p class="price"><%=x.getInt(4)%></p>
      <form action="checkout.html">
      <p><button>Buy Now</button></p></form>
    </div>
  </div>

 

<%}%>
  

  
  


  
</div>




</body>
</html>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>