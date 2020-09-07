$(document).ready(function() {
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


  })
