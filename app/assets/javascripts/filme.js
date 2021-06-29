$(document).ready(function(){

  $("#id_busca").bind("ajax:before", () => {
    $("#spinner").removeClass('desativar').addClass("ativar");
      console.log("Entrou no evento ajax:send");
  });

  $("#id_busca").bind("ajax:success", () => {
    $("#spinner").removeClass('ativar').addClass("desativar");
      console.log("Entrou no evento ajax:success");
  });
});