$(document).on('turbolinks:load', function() {
  $('input[name="header_date"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
          cancelLabel: 'Clear'
      }
		});
		
		$('input[name="header_date"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
      $("#HeaderExpFilter").fadeOut();
  });

  $('input[name="header_date"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      $("#HeaderExpFilter").fadeOut();
  });

	$(window).on("scroll load",function(){
		if($(window).scrollTop() > 400){
			$(".header_wrap_pc_scroll").addClass("active");
			$(".top_sns_wrap").fadeIn();
			$(".common_up_btn").fadeIn();
		}else{
			$(".top_sns_wrap").fadeOut();
			$(".header_wrap_pc_scroll").removeClass("active");
			$(".header_exp_filter").fadeOut();
      $(".header_exp_popup").fadeOut();
      $("#MenuBtn").removeClass("active");
      $(".header_nav_block").stop().slideUp();
      $(".common_up_btn").fadeOut();
		}
	});
	
	$(window).on("scroll load",function(){
		if($(window).scrollTop() > 175){
			$(".header_wrap_form_scroll").addClass("active");
		}else{
			$(".header_wrap_form_scroll").removeClass("active");
		}
	});
		
	/* Header search */
	
	$("#HeaderSearchDate").on("click",function(){
  	$("#HeaderPlacePop").hide();
  	$("#HeaderExpPop").hide();
  	$("#HeaderExpFilter").fadeIn();
	});
	
	$("#HeaderSearchExp").on("click",function(){
		$("#HeaderExpFilter").fadeIn();
		$("#HeaderExpPop").show();
		$("#HeaderPlacePop").hide();
	});
	
	$("#HeaderSearchPlace").on("click",function(){
    $("#HeaderExpFilter").fadeIn();
    $("#HeaderExpPop").hide();
    $("#HeaderPlacePop").show();
  });	
	
	$("#HeaderExpFilter").on("click",function(){
		$(this).fadeOut();
		$("#HeaderExpPop").hide();
		$("#HeaderPlacePop").hide();
	});
	
	var Header_Place = [];
	
	$("#HeaderSearchPlace_Choose .top_mv_place_item").on("click",function(){
  	Header_Place = [];
  	$(this).toggleClass("active");
  	$("#HeaderSearchPlace_Choose .top_mv_place_item").each(function(){
    	if($(this).hasClass("active")){
      	
      	Header_Place.push($(this).data("place"));
    	}
    	
  	});
  	
  	$("#HeaderSearchPlace").attr("value",Header_Place);
  	
	});
	
	var HExpChecked = [];
	var HExpText;
	$("input[name='experience']").on("click",function(){
		HExpChecked = [];
  	$(this).toggleClass("active");
  	$("input[name='experience']").each(function(){
    	if($(this).hasClass("active")){
      	
      	HExpChecked.push($(this).data("hdex"));
    	}
    	
  	});
  	
  	$("#HeaderSearchExp").attr("value",HExpChecked );

	});


  
	
	/* TOP MV search */
	
	$(".top_mv input").on("click",function(){
  	$("#MvExpFilter").fadeIn();
	});
	
	$("#MvExpFilter").on("click",function(){
  	$(this).fadeOut();
  	$("#MvSearchPop").hide();
  	$("#MvSearchPlace_Choose").removeClass("active");
  	$("#MvSearchExp_Choose").removeClass("active");
  	$("#ExPlacePop").hide();
  	$("#ExSearchPop").hide();
  	$("#BlogCatPop").hide();
	});
	
	$("#MvSearchPlace").on("click",function(){
  	$("#MvSearchPop").show();
  	$("#MvSearchPlace_Choose").addClass("active");
  	$("#MvSearchExp_Choose").removeClass("active");
	});
	
	$("#MvSearchExp").on("click",function(){
  	$("#MvSearchPop").show();
  	$("#MvSearchPlace_Choose").removeClass("active");
  	$("#MvSearchExp_Choose").addClass("active");
	});
	
	$("#MvSearchDate").on("click",function(){
//   	$("#MvExpFilter").hide();
  	$("#MvSearchPop").hide();
  	$("#MvSearchPlace_Choose").removeClass("active");
  	$("#MvSearchExp_Choose").removeClass("active");
	});
	
/*
	$(".applyBtn").on("click",function(){
  	$("#MvExpFilter").fadeOut();
	});
	
	$(".cancelBtn").on("click",function(){
  	$("#MvExpFilter").fadeOut();
	});
*/
	
	var MV_Place = [];
	
	$("#MvSearchPlace_Choose .top_mv_place_item").on("click",function(){
  	MV_Place = [];
  	$(this).toggleClass("active");
  	$("#MvSearchPlace_Choose .top_mv_place_item").each(function(){
    	if($(this).hasClass("active")){
      	
      	MV_Place.push($(this).data("place"));
    	}
    	
  	});
  	
  	$("#MvSearchPlace").attr("value",MV_Place);
  	
	});
	
	var MV_Ex = [];
	$("#MvSearchExp_Choose .top_mv_place_item").on("click",function(){
		MV_Ex = [];
  	$(this).toggleClass("active");
		$("#MvSearchExp_Choose .top_mv_place_item").each(function(){
    	if($(this).hasClass("active")){
      	
				MV_Ex.push($(this).data("ex"));
    	}
    	
  	});
  	
		$("#MvSearchExp").attr("value", MV_Ex);
  	
	});
	
	// $("input[name='mv_experience']").on("click",function(){
  // 	MV_Ex = [];
  // 	$(this).toggleClass("active");
  // 	$("input[name='mv_experience']").each(function(){
  //   	if($(this).hasClass("active")){
      	
  //     	MV_Ex.push($(this).data("ex"));
  //   	}
    	
  // 	});
  	
  // 	$("#MvSearchExp").attr("value",MV_Ex);
  	
	// });	
	
	/* Experienct search */
	
	$("#ExSearchDate").on("click",function(){
  	$("#ExPlacePop").hide();
  	$("#ExSearchPop").hide();
//   	$("#MvExpFilter").fadeOut();
	});
	
	$("#ExSearchExp").on("click",function(){
		$("#MvExpFilter").fadeIn();
		$("#ExSearchPop").show();
		$("#ExPlacePop").hide();
	});
	
	$("#ExSearchPlace").on("click",function(){
    $("#MvExpFilter").fadeIn();
    $("#ExSearchPop").hide();
    $("#ExPlacePop").show();
    $("#BlogCatPop").hide();
  });	
  
  $("#BlogCat").on("click",function(){
    $("#MvExpFilter").fadeIn();
    $("#ExPlacePop").hide();
    $("#BlogCatPop").show();
  });	
	
	var Ex_Place = [];
	
	$("#EXSearchPlace_Choose .top_mv_place_item").on("click",function(){
  	Ex_Place = [];
  	$(this).toggleClass("active");
  	$("#EXSearchPlace_Choose .top_mv_place_item").each(function(){
    	if($(this).hasClass("active")){
      	
      	Ex_Place.push($(this).data("explace"));
    	}
    	
  	});
  	
  	$("#ExSearchPlace").attr("value",Ex_Place);
  	
	});
	
	var Blog_Cat = [];
	
	$("#BlogCat_Choose .top_mv_place_item").on("click",function(){
  	Blog_Cat = [];
  	$(this).toggleClass("active");
  	$("#BlogCat_Choose .top_mv_place_item").each(function(){
    	if($(this).hasClass("active")){
      	
      	Blog_Cat.push($(this).data("cat"));
    	}
    	
  	});
  	
  	$("#BlogCat").attr("value",Blog_Cat);
  	
	});

var ExpChecked = [];
	var HExpText;
	$("input[name='ex_experience']").on("click",function(){
		ExpChecked = [];
  	$(this).toggleClass("active");
  	$("input[name='ex_experience']").each(function(){
    	if($(this).hasClass("active")){
      	
      	ExpChecked.push($(this).data("excheck"));
    	}
    	
  	});
  	
  	$("#ExSearchExp").attr("value",ExpChecked );

	});
	
	
	
	
	$("#MenuBtn").on("click",function(){
  	$(this).toggleClass("active");
//   	$(".header_filter").fadeIn();
  	$(".header_nav_block").stop().slideToggle();
	});
	
	$(window).on("scroll",function(){
    
    var WinScroll = $(window).scrollTop();
    var WinHeight = $(window).height();
    
    if($(".top_weather_wrap").length){
  	  var Weather_Pos = $(".top_weather_wrap").offset().top;
  	}
  	
  	if (WinScroll > Weather_Pos-WinHeight/1.8){
      $("#WeatherPin").addClass("active");
    } 
    
  });
  
  /* Exchange */
  
  $(".top_exchange").on("click",function(){
    $(this).addClass("active").siblings().removeClass("active");
    var CountryChoose = $(this).find(".top_money_contury").data("contury");
    
    
    $(".MoneyCountry").each(function(){
      if($(this).text() != "JPY"){
        $(this).text(CountryChoose);
      }
    });
    
  });
  
  $(".side_exchange").on("click",function(){
    $(this).addClass("active").siblings().removeClass("active");
    var CountryChoose = $(this).find(".top_money_contury").data("contury");
    
    
    $(".SideMoneyCountry").each(function(){
      if($(this).text() != "JPY"){
        $(this).text(CountryChoose);
      }
    });
    
  });
  
  $("#ChangeBtn").on("click",function(){
    var OriginM = $("#MoneyOrigin").text();
    var ChangeM = $("#MoneyChange").text();
    
    $("#MoneyOrigin") .text(ChangeM);
    $("#MoneyChange") .text(OriginM);
    
  });
  
  $("#SideExChangeBtn").on("click",function(){
    var SideOriginM = $("#SideMoneyOrigin").text();
    var SideChangeM = $("#SideMoneyChange").text();
    
    $("#SideMoneyOrigin") .text(SideChangeM);
    $("#SideMoneyChange") .text(SideOriginM);
    
  });
  
  
  
  $('a[href^="#"]').on("click",function(){
  	var speed = 500; 
  	var href= $(this).attr("href");
  	var target = $(href == "#" || href == "" ? 'html' : href);
  	if(target.length){
  	  var position = target.offset().top-79;
  	}
  	$("body,html").animate({scrollTop:position}, speed, 'swing');
  	return false;
  });
  
	$("#SideChangeBtn").on("click",function(){
		$(".side_change_money").stop().slideToggle();
	}); 
	
	$(window).on("load resize",function(){
		
		if($(window).width()>960){
			$(".BlogPeople").on("mouseover",function(){
				$(this).next().show();
			});
			
			$(".BlogPeople").on("mouseout",function(){
				$(this).next().hide();
			});
		}
		
	}); 
	
	
	/* side sns */
	
  $(window).on("load resize",function(){
    
    if($(window).width() > 960){
      $(".share-button").on("mouseover",function(){
        $(".top_sns_inner").css({"width":"auto"});
      });
      $(".share-button").on("mouseout",function(){
        $(".top_sns_inner").css({"width":"30px"});
      });
    }else{
      $(".top_sns_inner").css({"width":"auto"});
      $(".share-button").on("mouseover",function(){
        $(".top_sns_inner").css({"width":"auto"});
      });
      $(".share-button").on("mouseout",function(){
        $(".top_sns_inner").css({"width":"auto"});
      });
    }
    
  });

    
		
/* search fix bnr */
  
  $(window).on("load resize",function(){
    
    if($(window).width() > 960){
      
      var MainHeight = $(".exdetail_left_block").height();
      var SubHeight = $(".exdetail_right_top").innerHeight();
      
    //   console.log(SubHeight);
      
      if(MainHeight > SubHeight){
        $(".exdetail_right_block").css({"height":MainHeight-80});
      }else{
        $(".exdetail_left_block").css({"height":SubHeight});
        $(".exdetail_right_block").css({"height":SubHeight,"padding-bottom":"100px"});
      }
      
    }else{
      $(".exdetail_left_block").css({"height":"auto"});
      $(".exdetail_right_block").css({"height":"auto"});
      $(".exdetail_right_top").css({"position":"relative","top":"inherit"});
    }
    
  });
		
  $(window).on("scroll load",function() {
    $(".exdetail_right_top").each(function(){
        var menuTopMargin = 90;
        var parentY = $(this).parent().offset().top;
        var parentH = $(this).parent().height();
        var targetScrollValue = parentY - menuTopMargin;
        var wScrollvalue = $(window).scrollTop();
        var obj = {};
        if(wScrollvalue > targetScrollValue && $(window).width() > 960){
            if(wScrollvalue > (parentY + parentH) - (menuTopMargin +$(this).height()) ){
                obj = {
                    position: "absolute",
                    top: parentH - $(this).height()
                    };
                }
            else{
                obj = {
                    position: "fixed",
                    top: menuTopMargin
                    };
                }
            }
        else if(wScrollvalue < targetScrollValue && $(window).width() > 960){
            obj = {
                position: "absolute",
                top: "0"
                };
            }
        $(this).css(obj); //cssを適用。
    });
  });
		
  
    	
});















