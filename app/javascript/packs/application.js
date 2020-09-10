// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

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
  }),
  $("img[title]").on({
      "click": function() {
          if ($("#photo-tab").hasClass("avatar")) {

            var title = $(this).attr("title");
            var source = $(this).attr("src");
            var description = $(this).attr("desc");

            $("#modal-photo-body").attr("src", source);
            document.getElementById("modal-photo-title").innerHTML = title
            document.getElementById("modal-photo-description").innerHTML = description

          }
          else {
            var title = $(this).attr("title");
          //  var source = $(this).attr("src");
            var description = $(this).attr("desc");

          //  $("#modal-album-body").attr("src", source);
            document.getElementById("modal-album-title").innerHTML = title
            document.getElementById("modal-album-description").innerHTML = description
          }

      }
  })
});
