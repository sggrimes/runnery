$(document).ready(

function (){

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