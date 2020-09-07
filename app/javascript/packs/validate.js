$(document).ready(function(){
    $("#signup-form").validate({
        rules: {
            'user[firstname]': {
                required: true,
                maxlength: 25
            },
            'user[lastname]': {
                required: true,
                maxlength: 25
            },
            'user[email]': {
              required: true,
              maxlength: 255
            },
            'user[password]': {
              required: true,
              maxlength: 64,
              minlength: 6
            },
            'user[password_confirmation]': {
              required: true,
              maxlength: 64,
              equalTo: "#user_password"
            }
        },
        messages: {
            'user[firstname]': {
                required: "Please enter your first name",
                maxlength: "Your first name should be at most 25 characters"
            },
            'user[lastname]': {
                required: "Please enter your last name",
                maxlength: "Your last name should be at most 25 characters"
            },
            'user[email]': {
              required: "Please enter you email",
              maxlength: "Your email should be at most 255 characters"
            },
            'user[password]': {
                required: "Please provide a password",
                maxlength: "Your password must be at most 64 characters",
                minlength: "Your password must be at least 6 characters"
            },
            'user[password_confirmation]': {
                required: "Please provide a password",
                maxlength: "Your password must be at most 64 characters",
                equalTo: "Please enter the same password as above"
            }
        }
    }),
    $("#signin-form").validate({
        rules: {
          'user[email]': {
            required: true,
            maxlength: 255
          },
          'user[password]': {
            required: true,
            maxlength: 64
          }
      },
      messages: {
        'user[email]': {
          required: "Please enter you email",
          maxlength: "Your email should be at most 255 characters"
        },
        'user[password]': {
            required: "Please provide a password",
            maxlength: "Your password must be at most 64 characters"
          }
      }
  })
});
