var validate_email = function() {
  console.log("hey triggered")
  $('#company_email').change(function () {
    var email = $(this).val();
    var regex_op = /^([^@\s]+)@getmainstreet.com$/i;
    if(regex_op.test(email)){

    } else {
      alert ("The given email   " + email + " is invalid. It should be getmainstreet domain")
      $(this).val("")
    }
  });
}

$(document).on("turbolinks:load",function(){
  validate_email()
})