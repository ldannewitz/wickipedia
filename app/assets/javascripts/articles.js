$(document).ready(function(){

  $("body").on("click",".article-link a", function(event){
    event.preventDefault();
    var blah = $(this);
    var route = $(this).attr("href");

    var ajaxRequest = $.ajax({
      method: "GET",
      url: route
    });

    ajaxRequest.done(function(partial){
      $(".article").empty();
      $(".article").append(partial);
      blah.closest("span").addClass("active-link");
    });
  });
});
