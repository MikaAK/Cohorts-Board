var ready;
ready = function() {
  var jPM = $.jPanelMenu({
    menu: '#sidebar',
    trigger: '.menu'
  })
  jPM.on();
};

$(document).ready(ready);
$(document).on('page:load', ready);
