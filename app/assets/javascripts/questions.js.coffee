$ ->
  # trigger chosen
  $('.chzn-select').chosen({no_results_text: "小破厂没这么高级的球员吧"})
  # clear question-title placeholder
  $('#question_title').focus ->
    $(this).removeAttr("placeholder")
