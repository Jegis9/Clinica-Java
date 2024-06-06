function showFields() {
  var selectValue = document.getElementById("mySelect").value;
  var extraFieldsDiv = document.getElementById("extraFields");
  
  if (selectValue === "opcion1") {
    extraFieldsDiv.style.display = "block"; // Muestra los campos adicionales
  } else {
    extraFieldsDiv.style.display = "none"; // Oculta los campos adicionales
  }
}
