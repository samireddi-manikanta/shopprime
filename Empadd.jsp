<%@ page import="java.sql.*"%>

<%

int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String address=request.getParameter("address");
String desig=request.getParameter("desig");

int salary=Integer.parseInt(request.getParameter("salary"));


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("insert into Employee values(?,?,?,?,?)");
    ps.setInt(1,id);
    ps.setString(2,name);
    ps.setString(3,address);
    ps.setString(4,desig);
    ps.setInt(5,salary);
    
    
    int i=ps.executeUpdate(); 
    if(i==0)
    {%>
        <script>
            alert("inserttion not succesful");
            location.replace("adminemp.html");
          </script>
    <%} 
    else
    {%>
        <script>
            alert("inserttion succesful");
            location.replace("adminemp.html");

          </script>
    <%}
    con.close();   
}
catch(Exception e)
{
    out.print(e);
}   


%>