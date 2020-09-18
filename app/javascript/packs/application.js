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
        required: "Please enter your email",
        maxlength: "Your email should be at most 255 characters"
      },
      'user[password]': {
        required: "Please enter a password",
        maxlength: "Your password must be at most 64 characters",
        minlength: "Your password must be at least 6 characters"
      },
      'user[password_confirmation]': {
        required: "Please enter a password",
        maxlength: "Your password must be at most 64 characters",
        equalTo: "Please enter the same password as above"
      }
    }
  });
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
        maxlength: "Your password should be at most 64 characters"
      }
    }
  });
  $("img[title]").on({
    "click": function() {
      if ($("#photo-option").hasClass("avatar") || $("#photo-tab").hasClass("active")) {
        var title = $(this).attr("title");
        var source = $(this).attr("src");
        var description = $(this).attr("desc");

        $("#modal-photo-body").attr("src", source);
        document.getElementById("modal-photo-title").innerHTML = title
        document.getElementById("modal-photo-description").innerHTML = description
      }
      else {
        var title = $(this).attr("title");
        var description = $(this).attr("desc");

        document.getElementById("modal-album-title").innerHTML = title
        document.getElementById("modal-album-description").innerHTML = description
      }

    }
  });
  $("#new-photo-form").validate({
    rules: {
      'photo[title]': {
        required: true,
        maxlength: 140
      },
      'photo[description]': {
        required: true,
        maxlength: 300
      },
      'photo[image]': {
        required: true,
        accept: "image/jpeg,image/png,image/gif"
      }
    },
    messages: {
      'photo[title]': {
        required: "Please enter a title for your photo",
        maxlength: "Title should be maximum 140 characters"
      },
      'photo[description]': {
        required: "Please enter a description for your photo",
        maxlength: "Description should be maximum 300 charaters"
      },
      'photo[image]': {
        required: "Please choose a photo",
        accept: "Only image with .jpeg, .png or .gif is accepted"
      }
    }
  });
  $("#new-album-form").validate({
    rules: {
      'album[title]': {
        required: true,
        maxlength: 140
      },
      'album[description]': {
        required: true,
        maxlength: 300
      }
    },
    messages: {
      'album[title]': {
        required: "Please enter a title for your photo",
        maxlength: "Title should be maximum 140 characters"
      },
      'album[description]': {
        required: "Please enter a description for your photo",
        maxlength: "Description should be maximum 300 charaters"
      }
    }
  });
  $("#edit-user-form").validate({
    rules: {
      'user[current_password]': 'required',
      'user[avatar]': {
        extension: "jpeg|png|gif"
      }
    },
    messages: {
      'user[current_password]': "Please enter your current password to confirm changes",
      'user[avatar]': {
        extension: "Only image with .jpeg, .png or .gif is accepted"
      }
    }
  });
  $("[name='follow']").on({
    "click": function() {
      if ($(this).hasClass("follow")) {
        $(this).removeClass('follow');
        $(this).addClass('followed');
        $(this).html("following");
        // if ($("#following-tab")) {
          //   var count-following = document.getElementById("following-tab");
          //   count-following.text(parseInt(count-following.text())+1);
          // }
        }
        else {
          $(this).removeClass('followed');
          $(this).addClass('follow');
          $(this).html("follow");
          // if ($("#following-tab")) {
            //   var count-following = document.getElementById("following-tab");
            //   count-following.text(parseInt(count-following.text())-1);
            // }
          }
        }
      });
      $("a[name='like']").on({
        "click": function() {
          var count = $(this).next();

          if ($(this).children().hasClass("text-color")) {
            $(this).children().removeClass("text-color");
            $(this).children().addClass("text-gray");
            count.text(parseInt(count.text())-1);
          }
          else {
            $(this).children().removeClass("text-gray");
            $(this).children().addClass("text-color");
            count.text(parseInt(count.text())+1);
          }
        }
      })
    });
    
