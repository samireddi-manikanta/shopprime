<%@ page import="java.sql.*"%>

<%

String email=request.getParameter("Email");
String pass=request.getParameter("NP");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nik");
    PreparedStatement ps=con.prepareStatement("select * from admin where email=? and password=? ");
    ps.setString(1,email);
    ps.setString(2,pass);
    ResultSet x=ps.executeQuery();
    out.println(pass);
    if(x.next()){
        out.print("login Sucessfully Completed....");
        response.sendRedirect("admin.html");
    }else{
        out.print("login not Sucessfully Completed....");
        out.print("USERID and PASSWORD are incorrect");
    }
       

}catch(Exception e){
    out.print(e);
}
%>