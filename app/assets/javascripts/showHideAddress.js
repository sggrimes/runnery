$(document).on('pageinit pageshow', 'div:jqmData(role="page"), div:jqmData(role="dialog")', 

	function(event){

	$("#user_user_type").change( function(){

		if($("select option:selected").val() == "true"){

		$("label[for='user_address']").hide();
		$("#user_address").hide();

		}

		else {

		$("label[for='user_address']").show();
		$("#user_address").show();

		}

		});
	});