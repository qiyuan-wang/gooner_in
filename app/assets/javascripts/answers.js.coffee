$ ->
  do ->
    # editor buttons
    buttons = [
      'bold', 'italic', 'deleted', '|',
      'unorderedlist', 'orderedlist', 'indent', '|',
      'image', 'video', 'link', '|', 'horizontalrule'
    ]

    #editor settings
    settings = 
      lang: 'zh_cn'
      autoresize: false
      fixed: true
      focus: true
      buttons: buttons
		
    $('#redactor_content').redactor settings

