// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $(".cd-btn.main-action").click(function(e) {
    var value = $("#repair_category").val();
    href = $(".cd-btn.main-action").attr('href')
    $(".cd-btn.main-action").attr('href', href + "?category_before_register=" + value);
  });
});
