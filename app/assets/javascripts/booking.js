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
    let myObj = {
      // first_choice: ,
      // second_choice:,
      // third_choice:,
      // num_of_people:,
      // interpreter:,
      // experience_id:,
      guest_firstnam: $("#guest-firstname").val(),
      guest_lastname: $("#guest-lastname").val(),
      guest_title: $("#guest-title").val(),
      age: $("#age").val(),
      nationality: $("#nationality").val(),
      language: $("#language").val(),
      phone_number: $("#phone-number").val(),
      email: $("#email").val(),
      address: $("#address").val(),
      // representative_firstname: document.getElementById("guest-lastname").value,
      // representative_lastname: document.getElementById("guest-lastname").value,
      // representative_title: document.getElementById("guest-lastname").value,
      // representative_email: document.getElementById("guest-lastname").value,
      // send_mail_only_representative: document.getElementById("guest-lastname").value,
    }


    let myObj_serialized = JSON.stringify(myObj);
    localStorage.setItem("myObj", myObj_serialized);
    let myObj_deserialized = JSON.parse(localStorage.getItem("myObj"));
    console.log(myObj_deserialized);
  });
});