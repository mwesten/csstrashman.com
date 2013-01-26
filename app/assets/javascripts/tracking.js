$(function() {
  var wait_time = 0;

  if(typeof _gaq !== 'undefined') { // analytics is only initialized in production
    $('span.stButton').click(function() {
      _gaq.push(['_trackEvent', 'social', 'click']);
    });
    $('form.url').submit(function() {
      _gaq.push(['_trackEvent', 'query', 'submit']);
    });
    if($('code.language-css').length) {
      _gaq.push(['_trackEvent', 'result', 'view']);
    }
    if($('div.loading').length) {
      window.setInterval(
        function() {
          wait_time += 2;
          _gaq.push(['_trackEvent', 'result', 'loading', 'wait_time', wait_time]);
        },
        2000
      );
    }
  }
});
