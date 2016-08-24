window.addEventListener("load", function() {
  $("li").on("click", function() {
    $("li.active").removeClass("active");
    $(this).addClass("active");
  });
});
