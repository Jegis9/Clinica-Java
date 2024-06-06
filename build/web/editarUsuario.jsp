
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>HOLAN MUNDO</h1>
            <%
    Connection con;
    String url="jdbc:mysql://localhost:3306/analisis";
    String Driver="com.mysql.jdbc.Driver";
    String user="root";
    String clave="1234";

    Class.forName(Driver);
    con=DriverManager.getConnection(url,user,clave);
    

    PreparedStatement ps;
    ResultSet rs;
    String id = request.getParameter("id_persona");
    ps=con.prepareStatement("select * from persona where id_persona=" +id);
    rs=ps.executeQuery();
    while(rs.next()){
                
        

%>
    <div class="container-fluid">
    <div class="container">
        <center>
        <h1>EDITAR NUEVO USUARIO</h1>
        <form method="post" action="" class="form-control" style="width: 500px; height: 400px">
            <label>ID:</label>
            <input type="text" readonly="" class="form-control" value="<%= rs.getInt("id_persona")%>">
            <label>NOMBRE</label>
            <input type="text" name="txtnombre" class="form-control" value="<%= rs.getString("nombre")%>">
           <label>CONTRASEÑA</label>
            <input type="text" name="txtpass" class="form-control" value="<%= rs.getString("contraseña")%>">
            <input type="submit" value="GuardarH" class="btn btn-primary">
            <a href="listarCitas.jsp">Cancelar</a>
        </form></center>
        <%}%>
    </div>


</div>
    </body>
</html>
<%
String id_persona,nombre,contraseña;
id_persona=request.getParameter("txtid");
nombre=request.getParameter("txtnombre");
contraseña=request.getParameter("txtpass");

if (id_persona!=null && nombre!=null &&  contraseña!=null ) {
        ps= con.prepareStatement("update persona set nombre = '"+nombre+"', contraseña= '"+contraseña+"' where id_persona="+id);
        ps.executeUpdate();
        response.sendRedirect("listarHistorial.jsp");
    }

%>
