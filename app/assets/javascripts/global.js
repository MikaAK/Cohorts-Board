var ready;
ready = function() {
  var jPM = $.jPanelMenu({
    menu: '#sidebar',
    trigger: '.menu',
    duration: 500
  })
  jPM.on();
};

$(document).ready(ready);
