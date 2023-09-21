<%@ page import="java.sql.*"%>

<%

int id=Integer.parseInt(request.getParameter("id"));



try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("delete from Employee where id=?");
    ps.setInt(1,id);
    
    
    
    int i=ps.executeUpdate(); 
    if(i==0)
    {%>
        <script>
            alert("deletion not succesful");
            location.replace("adminemp.html");

          </script>
    <%} 
    else
    {%>
        <script>
            alert("deletion succesful");
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