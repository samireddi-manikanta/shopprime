<%@ page import="java.sql.*"%>

<%

int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String image=request.getParameter("image");

int price=Integer.parseInt(request.getParameter("price"));
int units=Integer.parseInt(request.getParameter("units"));
String category=request.getParameter("category");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("insert into Products values(?,?,?,?,?,?)");
    ps.setInt(1,id);
    ps.setString(2,name);
    ps.setString(3,name);
    ps.setInt(4,price);
    ps.setInt(5,units);
    ps.setString(6,category);
    
    
    int i=ps.executeUpdate(); 
    if(i==0)
    {%>
        <script>
            alert("inserttion not succesful");
            location.replace("adminprod.html");
          </script>
    <%} 
    else
    {%>
        <script>
            alert("inserttion succesful");
            location.replace("adminprod.html");

          </script>
    <%}
    con.close();   
}
catch(Exception e)
{
    out.print(e);
}   


%>