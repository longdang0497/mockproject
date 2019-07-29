// カレンダーhtml
  var monthdays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  var month_en = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
  var days = new Array("日", "月", "火", "水", "木", "金", "土");
  var days_en = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
  var days_en_b = new Array("Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
  //祝日は毎年変更しないと行けない!!!
  // 祝日1：何月の何日か？
	var Holidays1 = gon.avalailabledates;
	
  // 祝日2：何月の第何月曜日か？
  // var Holidays2 = new Array(1,1, 1,2, 3,4, 7,3, 9,3, 10,2);
  
  // 現在の年、月、日の取得
  var now = new Date();
  var thisYear = now.getFullYear();
  var thisMonth = now.getMonth() + 1;
  var today = now.getDate();
  
  function showCalen(n) {
    // 表示年月の記憶
    var year = thisYear;
    var month = thisMonth;
    
    // var i;
    // for (i = 0; i < gon.months.size; i++) {
    //   gon.months[i].month
    // }
      
    month += n;
    if (month == 0) { year--; month=12; }
    else if (month == 13) { year++; month = 1; }
    else if (month == 14) { year++; month = 2; }
    var flag = (year == thisYear && month == thisMonth) ? 1: 0;
    var date = new Date(year, month-1, 1);  // 表示月の 1日の Date()
    var startDay = date.getDay();
    var dateMax = monthdays[month - 1];
    if (month == 2 && ((year%4 == 0 && year%100 != 0) || year%400 == 0)) dateMax = 29;
    // 休日配列の初期化
    var holidays = new Array();
    for (var i = 0; i <= dateMax; i++) holidays[i] = 0;
    // 祝日1 の処理
    var firstSunday = (startDay == 0) ? 1: 8 - startDay;
    for (i = 0; i < Holidays1.length; i += 2) {
      if (Holidays1[i] == month) {
        holidays[Holidays1[i+1]] = 1;
        for (var j = firstSunday; j < dateMax; j += 7)
          if (Holidays1[i+1] == j ) { holidays[j+1] = 1; break; }  // 振替休日
      }
    }
    // 祝日2 の処理
    // var mondays = new Array();
    // var firstMonday = (startDay < 2) ? 2 - startDay: 9 - startDay;
    // for (i = 0; i < Holidays2.length; i += 2)
    //   if (Holidays2[i] == month) holidays[(Holidays2[i+1] - 1) * 7 + firstMonday] = 1;
//     var htmlStr = "<table class='calen0"+(n+1)+" fair_calendar_table'>\n" + "<tr class='bg1 fair_calendar_title'><th colspan=7>" + year + " " + month + " " + month_en[month-1] +"</th></tr>\n";
var htmlStr = "<table class='calen0"+(n+1)+" fair_calendar_table'>\n" + "<tr class='bg1 fair_calendar_title'><th colspan=7>" + month_en[month-1] + " " + year +"</th></tr>\n";
    htmlStr += "<tr class='bg2'><th class='sun fair_calendar_day'>" + days_en_b[0] + "</th>";
    for (i = 1; i < 6; i++) htmlStr += "<th class='fair_calendar_day'>" + days_en_b[i] + "</th>";
    htmlStr += "<th class='sat fair_calendar_day'>" + days_en_b[6] + "</th></tr>\n";
    var col = 0;
    if (startDay > 0) {
      htmlStr += "<tr>";
      for ( ; col < startDay; col++) htmlStr += "<td class='fair_calendar_date old'>&nbsp;</td>";
    }
    for (i = 1; i <= dateMax; i++) {
      if (col == 0) htmlStr += "<tr>";
      if (flag == 1 && i<today){
        htmlStr += "<td class='fair_calendar_date old " + days_en[col] + "' data-old='" + i + "'data-old-month='" + month + "' data-date='" + year + "-" + (month < 10 ? '0' : '') + month + "-" + (i < 10 ? '0' : '') + i + "'>";
      }
      else if (flag == 1 && i == today) {
        if (holidays[i] == 1) htmlStr += "<td class='today fair_calendar_date holiday "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +" data-date='"+ year + "-" + (month<10 ? '0' : '') + month + "-" + (i<10 ? '0' : '')+i +"'>";
        else if (holidays[i] == 0) htmlStr += "<td class='today fair_calendar_date old "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +"' data-date='"+ year + "-" + (month<10 ? '0' : '') +month + "-" + (i<10 ? '0' : '')+i +"'>";
        else htmlStr += "<td class='today fair_calendar_date old "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +"' data-date='"+ year + "-" + (month<10 ? '0' : '') +month + "-" + (i<10 ? '0' : '')+i +"'>";
      }
      else if (holidays[i] == 1) htmlStr += "<td class='fair_calendar_date holiday "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +"' data-date='"+ year + "-" + (month<10 ? '0' : '') +month + "-" + (i<10 ? '0' : '')+i +"'>";
      else if (holidays[i] == 0) htmlStr += "<td class='fair_calendar_date old "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +"' data-date='"+ year + "-" + (month<10 ? '0' : '') +month + "-" + (i<10 ? '0' : '')+i +"'>";
      else htmlStr += "<td class='fair_calendar_date old "+days_en[col]+"' data-old='"+ i +"'data-old-month='"+ month +"' data-date='"+ year + "-" + (month<10 ? '0' : '') +month + "-" + (i<10 ? '0' : '')+i +"'>";
      htmlStr +=  (i<10 ? '0' : '')+i + "</td>";
      if (col == 6) { htmlStr += "</tr>\n"; col=0; } else col++;
    }
    if (col != 0) {
      for ( ; col < 7; col++) htmlStr += "<td class='fair_calendar_date old'>&nbsp;</td>";
      htmlStr += "</tr>";
    }
    htmlStr += "</table>";
    
    return htmlStr;

  }  

$(function() {
  
  $(window).on("load",function(){
    // var currentMonth = 0;

    // for (var i = 0; i < gon.months.size; i++) {
    //   alert(gon.months[i]);
    //   if (thisMonth == gon.months[i]) 
    //    currentMonth = thisMonth;
    // }
    console.log(gon.avalailabledates);
    console.log(gon.exfroms);
    console.log(gon.extos);

    for(var c_i=0; c_i<3; c_i++){
      $("#Calen").append(showCalen(c_i));
    }

    //カレンダー1個だけ出す
    $(".calen01").addClass("c_active");
    $(".calen02").addClass("c_no_active");
    $(".calen03").addClass("c_no_active");    
    
    var pageCount=0;
    Page();
    
    /* 前へ&次へ */
    $("#FairNext").on("click",function(){
      $(".fair_calendar_table.c_active").next().addClass("c_active").removeClass("c_no_active").siblings().addClass("c_no_active").removeClass("c_active");
      pageCount+=1;
      Page();
      $(".fair_calendar_date").removeClass("fair_date_isactive");
    });
    
    $("#FairPrev").on("click",function(){
      $(".fair_calendar_table.c_active").prev().addClass("c_active").removeClass("c_no_active").siblings().addClass("c_no_active").removeClass("c_active");
      pageCount-=1;
      Page();
      $(".fair_calendar_date").removeClass("fair_date_isactive");
    });    

    function Page(){    
      if(pageCount == 0){
        $("#FairNext").show();
        $("#FairPrev").hide();
      }else if(pageCount == 1){
        $("#FairNext").show();
        $("#FairPrev").show();
      }else{
        $("#FairNext").hide();
        $("#FairPrev").show();
      }
    }
    
    
    //old判断
    $(".fair_calendar_date").each(function(){
      if($(this).data('old') < $(".today").data('old') && $(this).data('old-month') == $(".today").data('old-month')){
        $(this).addClass("old");
      }
      
      //火曜日除外
      if($(this).data('date') === "2017-08-15"){
        $(this).removeClass("old");
      }
      
    });
    
    var nowweek = now.getDay();
    $(".index_fair_right_date").text(thisMonth+"月"+today+"日"+"("+days[nowweek]+")");
    $(".today").addClass("fair_date_isactive");
    $(".index_fair_info_item").each(function(){
      if($(this).data('fairdate') === $(".fair_date_isactive").data('date')){
        $(this).show();
      }else{
        $(this).hide();
      }
    });
    
    //active色変更
    $(".fair_calendar_date").on("click",function(){
      $(this).addClass("fair_date_isactive").siblings().removeClass("fair_date_isactive").parent().siblings().find(".fair_calendar_date").removeClass("fair_date_isactive");
      
      if (localStorage.getItem("choosedday") === null) {
        // choosedday not exist 
        localStorage.choosedday = $(this).data('date');
      }
      else{
        localStorage.choosedday = $(this).data('date');
      }

      var dateactive = $(this).data("date").split("-");
      var dayactive = new Date( dateactive[0], dateactive[1]-1, dateactive[2] );
      var datemonth = Number(dateactive[1]);

      $(".index_fair_right_date").text(datemonth+"月"+dateactive[2]+"日"+"("+days[dayactive.getDay()]+")");
      
      $(".index_fair_info_item").each(function(){
        if($(this).data('fairdate') === $(".fair_date_isactive").data('date')){
          $(this).fadeIn();
        }else{
          $(this).hide();
        }
      });      
    });
    
    $(".fair_calendar_date.old").off("click");
      
  });
  
});

