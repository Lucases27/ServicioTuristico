function RecogerDatos(){
    var fecha = new Date();
    var medio = '';
    if($("#moto").is(':checked')){
        medio = $("#moto").val();
        if(fecha.getHours()>=17 && fecha.getHours()<=20){
            resultado = 55.80;
        }else{
        resultado = 34.88;
        // alert("selecciono moto: "+ resultado);
        }
    }else if($("#liviano").is(':checked')) {
        medio = $("#liviano").val();
        if (fecha.getHours()>=17 && fecha.getHours()<=20){
            resultado = 118.58;
        }
        else{
            resultado = 83.70;
            // alert("selecciono liviano: "+ resultado);
        }
    }else if($("#pesado").is(':checked')) {
        medio = $("#pesado").val();
        if (fecha.getHours()>=17 && fecha.getHours()<=20){
            resultado = 195.30;
        }
        else{
            resultado = 132.53;
            // alert("selecciono pesado: "+ resultado);
        }
    }else{
        alert ("Por favor seleccione su tipo de vehículo");
    }
    let mensajeFinal = "El pasajero de nombre: " + $("#nombre").val() + " " + $("#apellido").val() +
                        ", de numero: " + $("#numero").val() + " y email: " + $("#email").val() + 
                        " ha elegido el vehículo: " + medio + " en el horario: " + fecha.getHours()+ ":" + fecha.getMinutes() + " del mes de: " + mes[fecha.getMonth()] + ", por lo tanto el precio a cobrar es de: $" + resultado + ".";

    console.log(mensajeFinal);
    $("#rnombre").html($("#nombre").val() + " " +  $("#apellido").val());
    $("#rnumero").html( $("#numero").val());
    $("#remail").html( $("#email").val());
    $("#rmedio").html(medio);
    $("#rhora").html( fecha.getHours()+ ":" + fecha.getMinutes());
    $("#rtotal").html( "$ " + resultado);
// --------------------------------------------animaciones------------------------------------------------
    $("#rd").slideUp("fast");    
    $("#resumen").fadeIn(1500)
                .animate({
                    padding:'40px'
                },500)
                .delay(1000)
                .css("border","2px solid #ffcd6b");
    $("#rtitulo")
                    .slideDown(2000)
                    .delay(1000)
                    .animate({
                     width: '50%',
                     paddingLeft: '10px'
                    },500)
                    .animate({
                        width: '100%'  
                    },500)
                    .delay(300);


    $("#btnpagar").delay(1000)
                  .animate({
                      marginLeft:'80%'
                  },600);

     $("#car").delay(1000)
              .animate({
               marginLeft:'30%'
               },3000);
}
// ------------------------------------------------------------------------------------------------------
function mostrar(){
    $("#tarifa").toggle(800);
}

function sortTable() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTable");
    switching = true;
    while (switching) {
      switching = false;
      rows = table.rows;
      for (i = 1; i < (rows.length - 1); i++) {
      x = rows[i].getElementsByTagName("Td")[0];
      y = rows[i + 1].getElementsByTagName("Td")[0];
      if (Number(x.innerHTML) > Number(y.innerHTML)) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
    }
  }

  function Pagar(){
    var clave = prompt("Por favor ingrese su clave de seguridad.");

     if (clave == ""){
         alert("Este campo no puede estar vacío.");
         clave = false;
        if (clave == false){
             alert("Se canceló la acción de pago.");
        }
    }else if(clave == "1234"){
             alert("Se acreditó con exito su pago.");
// --------------------------------------------animaciones-----------------------------------------------
                 $("#car").delay(50)
                          .animate({
                             marginLeft:'76%',
                             opacity:0
                         },600)
                         .slideUp("fast");


                 $("#exito").delay(1000)
                            .slideDown("slow");
                
                
                 $("#btnpagar").slideUp("fast");
// ------------------------------------------------------------------------------------------------------
           }else{
          alert("Se canceló la acción de pago.");
          }   
} 
