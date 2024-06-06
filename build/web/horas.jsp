<%@ page language="java" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String fechaParam = request.getParameter("fecha");
    LocalDate fecha = LocalDate.parse(fechaParam);

    // Paso 1: Obtener las horas existentes en la base de datos para la fecha especificada
    List<String> horasDB = new ArrayList<>();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica", "root", "1234");
        PreparedStatement stmt = con.prepareStatement("SELECT hora FROM citas WHERE fecha = ?");
        stmt.setString(1, fecha.toString());
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            horasDB.add(rs.getString("hora"));
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Paso 2: Generar un rango de horas para mostrar en el listado
    LocalTime startTime = LocalTime.of(0, 0); // Hora de inicio (opcional: ajusta según tus necesidades)
    LocalTime endTime = LocalTime.of(23, 59); // Hora de fin (opcional: ajusta según tus necesidades)
    List<LocalTime> horasListado = new ArrayList<>();
    LocalTime time = startTime;
    while (!time.isAfter(endTime)) {
        horasListado.add(time);
        time = time.plusMinutes(30); // Incremento de tiempo (opcional: ajusta según tus necesidades)
    }

    // Paso 3: Filtrar las horas que no están en la base de datos
    List<LocalTime> horasFaltantes = new ArrayList<>();
    for (LocalTime hora : horasListado) {
        String horaStr = hora.toString();
        if (!horasDB.contains(horaStr)) {
            horasFaltantes.add(hora);
        }
    }

    // Paso 4: Generar las opciones del select con las horas faltantes
    for (LocalTime hora : horasFaltantes) {
        String optionValue = hora.toString();
        String optionText = hora.toString();
    }
    %>