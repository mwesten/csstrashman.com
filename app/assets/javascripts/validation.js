$(function() {
  $('form.url').submit(function() {
    if($('#styles_url').val().match(/\.css$/)) {
      alert("Trashman operates on webpages, not on CSS files themselves. Try specifying a page instead.");
      return false;
    }
  });
});
