jQuery(function($){
  var count = new Array(3);

  for (var i = 0; i < count.length; i++)
    count[i] = 0;

  function plus(receiver, index) {
    if (count[index] >= 0) {
      count[index]++;
      $(receiver).html(count[index]);
    }
  }

  function minus(receiver, index) {
    if (count[index] > 0) {
      count[index]--;
      console.log(count[index]);
      $(receiver).html(count[index]);
    }
  }

  $("#plus-infant").click(function() {
      plus(".num-infant",0);
  });
  $("#plus-children").click(function() {
      plus(".num-children",1);
  });
  $("#plus-adults").click(function() {
      plus(".num-adults",2);
  });


  $("#minus-infant").click(function() {
      minus(".num-infant",0);
  });
  $("#minus-children").click(function() {
      minus(".num-children",1);
  });
  $("#minus-adults").click(function() {
      minus(".num-adults",2);
  });

  $("#btnBooking").click(function() {
    localStorage.clear();
    debugger;
    let adults = $("#numAdults").text() != null ? $("#numAdults").text() : 0;
    let children= $("#numChildren").text() != null ? $("#numChildren").text() : 0;
    let infants = $("#numInfants").text() != null ? $("#numInfants").text() : 0;

    console.log(gon.price_adult);
    console.log(gon.price_children);
    console.log(gon.price_infant);

    let interpret = 0;
    if ($("input[name='interpreter']:checked").val() == "true" || $("input[name='interpreter']:checked").val() == true)
    {
      interpret = 200;
    }
    else if ($("input[name='interpreter']:checked").val() == "false" || $("input[name='interpreter']:checked").val() == false)
    {
      interpret = 0;
    }

    let expTotal = parseInt(adults) * gon.price_adult + parseInt(infants) * gon.price_infant + parseInt(children) * gon.price_children + interpret;

    var myObj = {
      first_choice: $("#first_choice").val(),
      second_choice: $("#second_choice").val(),
      third_choice: $("#third_choice").val(),
      first_starttime: $("#first_starttime").val(),
      second_starttime: $("#second_starttime").val(),
      third_starttime: $("#third_starttime").val(),
      interpreter: $("input[name='interpreter']:checked").val(),
      experience_id: gon.experience_id,
      numAdults: parseInt(adults),
      numChildren: parseInt(children),
      numInfants: parseInt(infants),
      total: expTotal != null ? expTotal : 0,
      guest_firstnam: $("#guest-firstname").val(),
      guest_lastname: $("#guest-lastname").val(),
      guest_title: $("#guest-title").val(),
      age: $("#age").val(),
      nationality: $("#nationality").val(),
      language: $("#language").val(),
      phone_number: $("#phone-number").val(),
      email: $("#email").val(),
      address: $("#address").val(),
      representative_firstname: $("#representative-firstname").val(),
      representative_lastname: $("#representative-lastname").val(),
      representative_title: $("#representative-title").val(),
      representative_email: $("#representative-email").val(),
      send_mail_only_representative: $("input[name='confirm']:checked").val(),
    };


    let myObj_serialized = JSON.stringify(myObj);
    localStorage.setItem("myObj", myObj_serialized);   
    
  });

  confirm_exp();
  
  $("#BookNow").click(function() {
    let myObj = JSON.parse(localStorage.getItem("myObj"));

    myObj['payment_type'] = $("#payment_type").val();
    myObj['card_num'] = $("#card_num").val();
    myObj['card_exp_month'] = parseInt($("#card_exp_month").val());
    myObj['card_exp_year'] = parseInt($("#card_exp_year").val());
    myObj['security_code'] = $("#security_code").val();
    myObj['card_firstname'] = $("#card_firstname").val();
    myObj['card_lastname'] = $("#card_lastname").val();

    let myObj_serialized = JSON.stringify(myObj);
    localStorage.setItem("myObj", myObj_serialized); 
  });
});

function confirm_exp() {
  let myObj_deserialized = JSON.parse(localStorage.getItem("myObj"));

  if (myObj_deserialized != null) {

    $("#show-first-choice").text(myObj_deserialized.first_choice != "" ? myObj_deserialized.first_choice : "Not choose");
    $("#show-second-choice").text(myObj_deserialized.second_choice != "" ? myObj_deserialized.second_choice : "Not choose");
    $("#show-third-choice").text(myObj_deserialized.third_choice != "" ? myObj_deserialized.third_choice : "Not choose");

    $("#show-first-starttime").text(myObj_deserialized.first_starttime != "" ? myObj_deserialized.first_starttime : "Not choose");
    $("#show-second-starttime").text(myObj_deserialized.second_starttime != "" ? myObj_deserialized.second_starttime : "Not choose");
    $("#show-third-starttime").text(myObj_deserialized.third_starttime != "" ? myObj_deserialized.third_starttime : "Not choose");

    if (myObj_deserialized.interpreter == "true")
    {
      $("#interpret").text("Need");
      $("#interpret-price").text("$US 200.00");
    }
    else
    {
      $("#interpret").text("Unnecessary");
      $("#interpret-price").text("$US 0.00");
    }

    $("#show-total").text(myObj_deserialized.total != null ? "$US " + myObj_deserialized.total.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") : 0);
    $("#show-num-infants").text(myObj_deserialized.numInfants >= 0 ? myObj_deserialized.numInfants : "0");
    $("#show-num-children").text(myObj_deserialized.numChildren >= 0 ? myObj_deserialized.numChildren : "0");
    $("#show-num-adults").text(myObj_deserialized.numAdults >= 0 ? myObj_deserialized.numAdults : "0");

    $("#show-total-infants").text(myObj_deserialized.numInfants ? "$US " + (myObj_deserialized.numInfants * parseInt(gon.price_infant)).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,").toString() : "0");
    $("#show-total-children").text(myObj_deserialized.numChildren ? "$US " + (myObj_deserialized.numChildren * gon.price_children).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") : "0");
    $("#show-total-adults").text(myObj_deserialized.numAdults ? "$US " + (myObj_deserialized.numAdults * gon.price_adult).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") : "0");

    if (myObj_deserialized.guest_title != null && myObj_deserialized.guest_firstnam != null && myObj_deserialized.guest_lastname)
      $("#show-guest-name").text(myObj_deserialized.guest_title + " " + myObj_deserialized.guest_firstnam + " " + myObj_deserialized.guest_lastname)
    else
      $("#show-guest-name").text("There might be some mistakes.");

    if (myObj_deserialized.representative_title != null && myObj_deserialized.representative_firstname != null && myObj_deserialized.representative_lastname)
      $("#show-representative-name").text(myObj_deserialized.representative_title + " " + myObj_deserialized.representative_firstname + " " + myObj_deserialized.representative_lastname)
    else
      $("#show-representative-name").text("There might have no representative.");

    if (myObj_deserialized.representative_email != "")
      $("#show-representative-email").text(myObj_deserialized.representative_email);
    else
      $("#show-representative-email").text("There might have no representative.");

    $("#show-guest-age").text(myObj_deserialized.age);
    $("#show-guest-nationality").text(myObj_deserialized.nationality);
    $("#show-guest-language").text(myObj_deserialized.language);
    $("#show-guest-email").text(myObj_deserialized.email);
    $("#show-guest-phone").text(myObj_deserialized.phone_number.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3'));
    $("#show-guest-address").text(myObj_deserialized.address);
    
    if (myObj_deserialized.send_mail_only_representative != null)
    {
      if (myObj_deserialized.send_mail_only_representative == "true")
        $("#show-confirm-email").text("Please send the Confirmation Email and Payment information only to me.");
      else 
        $("#show-confirm-email").text("Please send the Confirmation Email and Payment information to guest and me.");
    }
    else
      $("#show-confirm-email").text("");
  }
}