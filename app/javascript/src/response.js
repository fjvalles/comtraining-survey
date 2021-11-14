$(document).on("turbolinks:load", function() {
  $('#wlcm_next').click(function () {
    console.log("wlcm click");
    $('#main-wlcm').hide();
    $('#main-survey').show();
    if ($('#demo_next').length == 0) {
      $('#questionnaire-resp').show();
    }
  });

  $('#demo_next').click(function () {
    console.log("demo click");
    $('#demographic-resp').hide();
    $('#questionnaire-resp').show();
  });

  $('#questions_next').click(function () {
    console.log("quest click");
    $('#questionnaire-resp').hide();
    $('#open-quest-resp').show();
  });

}); // end turbolinks:load
