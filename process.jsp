
<%@page import="java.sql.*,java.util.*"%>
<%
//Read values from the myfood.html form
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String email=request.getParameter("email");
String mob=request.getParameter("mobile");
String pass=request.getParameter("password");
out.println(fname+" "+lname);
try
{
    Connection con =null;
    Class.forName("oracle.jdbc.driver.OracleDriver");  
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","nik");
    PreparedStatement ps=con.prepareStatement("insert into Person values(?,?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,lname);
    ps.setString(3,email);
    ps.setString(4,mob);
    ps.setString(5,pass);

    int i=ps.executeUpdate(); 
    if(i==0)
    {
        out.println("something went wrong.....");
    } 
    else
    {
        response.sendRedirect("login.html");
    }
    con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>