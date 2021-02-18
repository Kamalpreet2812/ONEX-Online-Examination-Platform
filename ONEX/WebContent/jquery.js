<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
$(document).ready(function(){
  $(".btn").hover(function(){
    $(this).css("background-color", "blue");
    }, function(){
    $(this).css("background-color", "pink");
  });
});