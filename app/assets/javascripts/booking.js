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

    let adults = $("#numAdults").text() ? $("#numAdults").text() : 0;
    let children= $("#numChildren").text() ? $("#numChildren").text() : 0;
    let infants = $("#numInfants").text() ? $("#numInfants").text() : 0;

    console.log(gon.price_adult);
    console.log(gon.price_children);
    console.log(gon.price_infant);

    let expTotal = parseInt(adults) * gon.price_adult + parseInt(infants) * gon.price_infant + parseInt(children) * gon.price_children;

    let myObj = {
      // first_choice: ,
      // second_choice:,
      // third_choice:,
      // num_of_people:,
      interpreter: $("input[name='interpreter']:checked").val(),
      // experience_id:,
      numAdults: adults,
      numChildren: children,
      numInfants: infants,
      total: expTotal,
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
      // send_mail_only_representative: $("#guest-lastname").val(),
    }


    let myObj_serialized = JSON.stringify(myObj);
    localStorage.setItem("myObj", myObj_serialized);
    let myObj_deserialized = JSON.parse(localStorage.getItem("myObj"));
    console.log(myObj_deserialized);
  });
});