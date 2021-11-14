$(document).on("turbolinks:load", function() {

  $('.edit_survey, .new_survey').delegate('.survey_questions_q_type select', 'change', function(){
    if($(this).val() == 'hor_radio' || $(this).val() == 'text') {
      $(this).closest('.nested-fields').find('.links').hide();
    }
    else {
      $(this).closest('.nested-fields').find('.links').show();
    }
  });

  $('.edit_survey, .new_survey').delegate('.table-bordered .add_fields', 'click', function(){
    // console.log($('#' + $(this).attr('id').split('_')[0] + '_collapse').eq(0).val());
    // if (!$('#' + $(this).attr('id').split('_')[0] + '_collapse').eq(0).data('aria-expanded')) {
    //   $('#' + $(this).attr('id').split('_')[0] + '_collapse_btn').eq(0).click();//closest('.nested-fields').find('.links').show();
    // }
  });

  $('.container').delegate('#survey_company_id, .cia-type, .qscale', 'change', function () {
    var url, data;
    data = { company_id: $('#survey_company_id').val(),
             s_type: $('#survey_s_type').val() }
    if ($('#survey_company_id').hasClass('cia-gnrl')) {
      url = '/surveys/gnrl_format.js';
    }
    else if ($('#survey_company_id').hasClass('cia-quest')) {
      url = '/surveys/questionnaire.js';
    }
    else if ($('#survey_company_id').hasClass('cia-prof')) {
      url = '/surveys/proficiencies.js';
    }
    else if ($('#survey_company_id').hasClass('cia-scale')) {
      url = '/surveys/answer_scale.js';
      data = { company_id: $('#survey_company_id').val(),
               s_type: $('#survey_s_type').val(),
               q_scale: $('.survey_questionnaire_scale .radio .qscale:checked').val(),
               alignment: $('.survey_default_alignment .radio .dalignment:checked').val()}
    }
    else if ($('#survey_company_id').hasClass('cia-demo')) {
      url = '/surveys/demo_quest.js';
    }
    else if ($('#survey_company_id').hasClass('cia-part')) {
      url = '/surveys/participants.js';
    }
    else if ($('#survey_company_id').hasClass('cia-eval')) {
      url = '/surveys/evaluators.js';
    }
    $.ajax({
      url: url,
      data: data,
      type: 'GET'
    });
  });

  $('.container').on('cocoon:before-insert', function(e, insertedItem) {
    console.log("After insert");
    console.log(insertedItem);
    console.log(insertedItem.parent());
    // console.log(insertedItem.find('.add-assoc').attr('id'));
  });

});
