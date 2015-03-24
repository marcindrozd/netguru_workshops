$(document).ready(function() {
  $("#add-review").hover(function(){
    $("#add-review").css('cursor', 'pointer');
  });

  $("#add-review").click(function(){
    $("#new_review").slideToggle();
  });
});
