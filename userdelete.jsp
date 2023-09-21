<%@ page import="java.sql.*"%>

<%

String email=request.getParameter("email");



try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("delete from Person where email=?");
    ps.setString(1,id);
    
    
    
    int i=ps.executeUpdate(); 
    if(i==0)
    {%>
        <script>
            alert("deletion not succesful");
            location.replace("admiuser.html");

          </script>
    <%} 
    else
    {%>
        <script>
            alert("deletion succesful");
            location.replace("adminuser.html");

          </script>
    <%}
    con.close();   
}
catch(Exception e)
{
    out.print(e);
}   


%>