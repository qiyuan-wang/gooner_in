// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(
	function()
	{
		$('#redactor_content').redactor({ lang: 'zh_cn',
                                          autoresize: true,
                                          fixed: true,
                                          buttons: [ 'bold', 'italic', 'deleted', '|',
                                                     'unorderedlist', 'orderedlist', 'indent', '|',
                                                     'image', 'video', 'link', '|', 
                                                     'horizontalrule' ]
                                        }
                                    );
    }
);