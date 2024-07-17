/**
 * 
 */
$(document).on("keyup", "input[속성명 지정]", function() {
	$(this).val( $(this).val().replace( /[^0-9]/gi ,"") );
	
		}
	)