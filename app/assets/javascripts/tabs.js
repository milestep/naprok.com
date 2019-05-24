$(document).ready(function() {
  $('.tab').click(function(e) {
    $('.tab-content').hide();
    var tab = $(this).data('tab');
    $(".tab-content[data-tab=" + tab + "]").show();
  })
})
