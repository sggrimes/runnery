$("body").ready(init);

$(window).scroll(showHideNav);

function init (){
	console.log("ready");
	showHideNav();
}

function showHideNav (e){

	var wrapperTop = $(".wrapper").position().top + $(".wrapper").height();
	var scrollPos = wrapperTop - 650;
	var top = $(window).scrollTop();

	if(top < scrollPos){

		$(".navbar-fixed-bottom").hide();
		
	}

	else {
		
		$(".navbar-fixed-bottom").show();
		

	}

	console.log($(window).scrollTop());
	console.log($(".wrapper").position().top);
	console.log($(".wrapper").height());

}