<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>VALIDACION - Consultorio Totonicapan</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!--EN CSS-->
    <link rel="stylesheet" href="style.css">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
  


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a href="index.html" class="navbar-brand d-flex align-items-center">
            <img class="img-fluid me-2" src="/img/Iconos/Captura de pantalla 2023-03-22 221838.png" width="270px" alt="" >
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-4 py-lg-0">
                <a href="inicio.jsp" class="nav-item nav-link active">Salir</a>
                <a href="Principal.jsp" class="nav-item nav-link">Regresar</a>
       
  
            
            </div>
            <div class="h-100 d-lg-inline-flex align-items-center d-none">
                <a class="btn btn-square rounded-circle bg-light text-primary me-2" href=""><i
                        class="fab fa-facebook-f"></i></a>
                <a class="btn btn-square rounded-circle bg-light text-primary me-2" href=""><i
                        class="fab fa-twitter"></i></a>
                <a class="btn btn-square rounded-circle bg-light text-primary me-0" href=""><i
                        class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->


<div class="container-fluid">
    <div class="container">
        <center>
        <h1>AGREGAR NUEVO PACIENTE</h1>
        <form method="post" action="" class="form-control" style="width: 500px; height: 400px">
            <label>NOMBRE</label>
            <input type="text" name="txtnombre" class="form-control">
            <label>APELLIDO</label>
            <input type="text" name="txtapellido" class="form-control">
            <label>FECHA NACIMIENTO</label>
            <input type="date" name="txtnacimiento" class="form-control">
            <label>DIRECCION </label>
            <input type="text" name="txtdireccion" class="form-control">
            <label>TELEFONO </label>
            <input type="text" name="txttelefono" class="form-control">
            <label>CORREO </label>
            <input type="text" name="txtcorreo" class="form-control">

            <input type="submit" value="Guardar Paciente" class="btn btn-primary">
            <a href="Principal.jsp">Cancelar</a>
        </form>
        </center>
    </div>


</div>


    <!-- Footer Start -->
    <div class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">


                <div class="col-lg-3 col-md-6">
                    <h5 class="mb-4">Contacto</h5>
                    <p><i class="fa fa-map-marker-alt me-3"></i>Totonicapan zona 2, Guatemala</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+502 2697-8888</p>
                    <p><i class="fa fa-envelope me-3"></i>Medicatusalud@gmail.com</p>
                </div>

                <div class="col-lg-3 col-md-6">
                    <h5 class="mb-4">Siguenos en nuestras redes</h5>
                    <div class="d-flex">
                   
                        <a class="btn btn-square rounded-circle me-1" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square rounded-circle me-1" href=""><i class="fab fa-youtube"></i></a>
          
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Footer End -->



    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>


<%
Connection con;
String url="jdbc:mysql://localhost:3306/clinica";
String Driver="com.mysql.jdbc.Driver";
String user="root";
String clave="1234";

Class.forName(Driver);
con=DriverManager.getConnection(url,user,clave);


PreparedStatement ps;
ResultSet rs;
String nombre,apellido,f_nacimiento,direaccion,telefono,correo;

nombre=request.getParameter("txtnombre");
apellido=request.getParameter("txtapellido");
f_nacimiento=request.getParameter("txtnacimiento");
direaccion=request.getParameter("txtdireccion");
telefono=request.getParameter("txttelefono");
correo=request.getParameter("txtcorreo");

if (nombre!=null && apellido!=null &&  f_nacimiento!=null &&direaccion!=null &&telefono!=null && correo!=null) {
        ps= con.prepareStatement("insert into paciente (nombre,apellido,f_nacimiento,direaccion,telefono,correo) values('"+nombre+"','"+apellido+"','"+f_nacimiento+"','"+direaccion+"','"+telefono+"','"+correo+"')");
        ps.executeUpdate();
        response.sendRedirect("agregarUsuarios.jsp");
    }

%>