$(document).on("turbolinks:load", function() {

  // Tootltip for tabs
  $('a[title]').tooltip();

  // Live search
  $(".search-query").bind("keyup", function() {
    $.ajax({
      url: '/model/search.js',
      data: { query: $(this).val() },
      type: 'GET'
    });
  });

  // Persisten tabs
  if (location.hash != '') {
    $('a[href="'+location.hash+'"]').tab('show');
  }

  $('a[data-toggle="tab"]').on('click', function(e) {
    location.hash = $(this).attr('href').substr(1);
  });

});
