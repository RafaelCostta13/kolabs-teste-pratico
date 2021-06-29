$(document).ready(function(){

  $("#id_busca").bind("ajax:before", () => {
    $("#card").remove();
    $("#sidebar_itens").remove()
    $("#spinner").removeClass('desativar').addClass("ativar");
  
  });

  $("#id_busca").bind("ajax:success", () => {
    $("#spinner").removeClass('ativar').addClass("desativar");
  });


  /* Filtros */

});
