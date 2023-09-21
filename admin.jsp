<%@ page import="java.sql.*"%>

<%

String email=request.getParameter("Email");
String pass=request.getParameter("NP");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("select * from admin where email=? and password=? ");
    PreparedStatement ct=con.prepareStatement("Select count(*) from person");
    PreparedStatement ad=con.prepareStatement("Select count(*) from Employee");
    PreparedStatement pd=con.prepareStatement("Select count(*) from Products");


    ps.setString(1,email);
    ps.setString(2,pass);
    ResultSet x=ps.executeQuery();
    ResultSet c=ct.executeQuery();
    ResultSet a=ad.executeQuery();
    ResultSet b=pd.executeQuery();

    a.next();
    c.next();
    b.next();
    out.println(pass);
   
       


%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif;}

.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 10;
  top: 0;
  left: 0;
  background-color: rgb(82, 6, 25);
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}
.sidebar .active{
  color: aqua;
}

.logo {
  width: 3cm;
  height: 3cm;
  margin-left: 0.5cm;
  margin-top: 0;
}

.nav{
  height: 70px;
  width: 100%;
  margin-left: 160px;
  background-color: darkturquoise;
  top: 0;
  left: 0;
  position: fixed;
}
.nav h2{
  padding-left: 10px;
  top: 0;
  position: relative;
  font-weight: bold;
  padding-top: 10px;
}
.nav a {
  text-decoration: none;
  font-weight: bold;
 /* float: right;
  padding-right: 100px;
  position: relative;*/

}
.nav p{
  font-size: large;
  float: right;
  padding-right: 50px;
  top: 0;
}

/*.main {
  margin-left: 160px;  Same as the width of the sidenav 
  padding: 0px 10px;
}*/


.content {
  margin-left: 150px;
  position: relative;
  margin-top: 9vh;
  min-height: 10vh;
  top: 0;
  left: 0;
  max-height: fit-content;
  background: #f1f1f1;
}

.content .cards {
  padding: 20px 15px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
}

.content .cards .card {
  width: 250px;
  height: 150px;
  background: white;
  margin: 20px 10px;
  display: flex;
  align-items: center;
  justify-content: space-around;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.content .content-2 {
  min-height: 60vh;
  display: flex;
  justify-content: space-around;
  align-items: flex-start;
  flex-wrap: wrap;
}

.content .content-2 .recent-payments {
  min-height: 50vh;
  flex: 5;
  background: white;
  margin: 0 25px 25px 25px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  display: flex;
  flex-direction: column;
}

.content .content-2 .new-students {
  flex: 2;
  background: white;
  min-height: 50vh;
  margin: 0 25px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  display: flex;
  flex-direction: column;
}

.content .content-2 .new-students table td:nth-child(1) img {
  height: 40px;
  width: 40px;
}
.content .cards .card .icon-case{
  width: 1.7cm;
  height: 1.7cm;
}

@media screen and (max-width: 1050px) {
  .side-menu li {
      font-size: 18px;
  }
}

@media screen and (max-width: 940px) {
  .side-menu li span {
      display: none;
  }
  .side-menu {
      align-items: center;
  }
  .side-menu li img {
      width: 40px;
      height: 40px;
  }
  .side-menu li:hover {
      background: #f05462;
      padding: 8px 38px;
      border: 2px solid white;
  }
}

@media screen and (max-width:536px) {
  .brand-name h1 {
      font-size: 16px;
  }
  .content .cards {
      justify-content: center;
  }
  .side-menu li img {
      width: 30px;
      height: 30px;
  }
  .content .content-2 .recent-payments table th:nth-child(2),
  .content .content-2 .recent-payments table td:nth-child(2) {
      display: none;
  }
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
  .nav{width: 50%;}
}

@keyframes example {
  0%   {left:0px; top:10px;}
</style>
</head>
<body>

<div class="sidebar">
  <img src="logoback.png" class="logo" />
  <br><br>
  <a href="#home" class="active"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="adminprod.html"><i class="fa fa-fw fa-wrench"></i>Products</a>
  <a href="adminemp.html"><i class="fa fa-fw fa-user"></i>Employees</a>
  <a href="#clients"><i class="fa fa-users" aria-hidden="true"></i> Users</a>
  <a href="#contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
</div>

<!---<div class="main">
  
  
</div>--->
<div class="nav">
  <table border="0"style="height: 5%;width:87%" >
    <tr>
      <td >
        <h2> <img src="pie-chart.png" style="height: 1cm;width:1cm;"/>  Admin Dashboard</h2>
      </td>
      <td style="width:50%;">
        <%
        if(x.next()){
          %>
          <p><%=x.getString(3)%>  <a href="adminlogin.html">Logout</a> </p>
          <%
      }else{%>
            <script>
              alert("USERID and PASSWORD are incorrect");
              location.replace("adminlogin.html");
            </script>
         // out.print("login not Sucessfully Completed....");
          //out.print("USERID and PASSWORD are incorrect");
      <%}
        %>  
        
        
      </td>
    </tr>
  </table>
</div>
<div class="content">
  <div class="cards">
      <div class="card">
          <div class="box">
              <h1><%=a.getInt(1)%></h1>
              <h3>Employees</h3>
          </div>
          <div >
              <img src="team.png" alt="" class="icon-case">
          </div>
      </div>
      <div class="card">
          <div class="box">
              <h1><%=c.getInt(1)%></h1>
              <h3>Users</h3>
          </div>
          <div >
              <img src="user.png" alt="" class="icon-case">
          </div>
      </div>
      <div class="card">
          <div class="box">
              <h1><%=b.getInt(1)%></h1>
              <h3>Products</h3>
          </div>
          <div >
              <img src="product.png" alt="" class="icon-case">
          </div>
      </div>
      <div class="card">
          <div class="box">
              <h1>350000</h1>
              <h3>Income</h3>
          </div>
              <img src="income.png" alt="" class="icon-case" >
      </div>
  </div> 
  
</body>
</html> 
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>