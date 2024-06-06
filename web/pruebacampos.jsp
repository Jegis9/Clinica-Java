<%-- 
    Document   : pruebacampos
    Created on : 16 may. 2023, 16:15:02
    Author     : AsusVivoBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Ejemplo de Select Dinámico</title>
  <script src="script.js"></script>
</head>
<body>
  <h1>Ejemplo de Select Dinámico</h1>
  
  <select id="mySelect" onchange="showFields()">
    <option value="">Selecciona una opción</option>
    <option value="opcion1">Opción 1</option>
    <option value="opcion2">Opción 2</option>
    <option value="opcion3">Opción 3</option>
  </select>
  
 
  <div id="extraFields" style="display: none;">
       <h2>ksksksks</h2>
    <label for="campo1">Campo 1:</label>
    <input type="text" id="campo1" name="campo1">
    <br>
    
    <label for="campo2">Campo 2:</label>
     <h2>ksksksks</h2>
    <input type="text" id="campo2" name="campo2">
  </div>
</body>
</html>
