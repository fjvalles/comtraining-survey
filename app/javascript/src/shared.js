var defaultProfile;

$(document).on('click', '#close-preview', function(){
  $('.image-preview').popover('hide');
  // Hover befor close the preview
  $('.image-preview').hover(
      function () {
         $('.image-preview').popover('show');
      },
       function () {
         $('.image-preview').popover('hide');
      }
  );
});

$(document).on("turbolinks:load", function() {

  $('[data-toggle="popover"]').popover();

  // $('.datatable').DataTable({
  //   stateSave: true,
  //   sPaginationType: "full_numbers",
  //   "aaSorting": [[ 0, "asc" ]],
  //   "bSort": true,
  //   bJQueryUI: true,
  //   "oLanguage": {
  //     "sProcessing":     "Procesando...",
  //     "sLengthMenu":     "Registros por página : _MENU_",
  //     "sZeroRecords":    "No se encontraron resultados",
  //     "sEmptyTable":     "Ningún dato disponible en esta tabla",
  //     "sInfo":           "Registros del _START_ al _END_ de un total de _TOTAL_ registros",
  //     "sInfoEmpty":      "No hay registros",
  //     "sInfoFiltered":   "",
  //     "sInfoPostFix":    "",
  //     "sSearch":         "Buscador : ",
  //     "sUrl":            "",
  //     "sInfoThousands":  ",",
  //     "sLoadingRecords": "Cargando...",
  //     "oAria": {
  //       "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
  //       "sSortDescending": ": Activar para ordenar la columna de manera descendente"
  //     },
  //     "oPaginate": {
  //       "sFirst": "<i class='glyphicon glyphicon-fast-backward'></i>",
  //       "sLast": "<i class='glyphicon glyphicon-fast-forward'></i>",
  //       "sNext": "<i class='glyphicon glyphicon-forward'></i>",
  //       "sPrevious": "<i class='glyphicon glyphicon-backward'></i>"
  //     }
  //   },
  //   "iDisplayLength": 25
  // });

  // Fade out for flash messages
  $(".alert" ).fadeOut(3000);


  // Create the close button
  var closebtn = $('<button/>', {
      type:"button",
      text: 'x',
      id: 'close-preview',
      style: 'font-size: initial;',
  });
  closebtn.attr("class","close pull-right");
  // Set the popover default content
  $('.image-preview').popover({
      trigger:'manual',
      html:true,
      title: "<strong>Vista previa</strong>"+$(closebtn)[0].outerHTML,
      content: "No hay imagen",
      placement:'bottom'
  });
  // Clear event
  $('.image-preview-clear').click(function(){
      $('.image-preview').attr("data-content","").popover('hide');
      $('.image-preview-filename').val("");
      $('.image-preview-clear').hide();
      $('.image-preview-input input:file').val("");
      $(".image-preview-input-title").text("Buscar");
      $('#avatar').attr('src', defaultProfile);
  });


  $(".user-img .image-preview-input input:file").change(function (){
      var file = this.files[0];
      var reader = new FileReader();
      reader.onload = function (e) {
          $(".image-preview-input-title").text("Cambiar");
          $(".image-preview-clear").show();
          $(".image-preview-filename").val(file.name);
          if (defaultProfile == undefined) {
            defaultProfile = $('#avatar').attr('src');
          }
          $('#avatar').attr('src', e.target.result);
      }
      reader.readAsDataURL(file);
  });

});
