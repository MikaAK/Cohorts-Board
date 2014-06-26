$(function() {
  checkMailer()
});

function loadOption(value) {
  $newStudent = $("#jPanelMenu-menu .new_student")
  $newMessage = $("#jPanelMenu-menu .new_message")
  $navPanel = $('#jPanelMenu-menu .nav-panel')

  switch(parseInt(value)) {
    case 1:
      $newMessage.add($navPanel).hide()
      $newStudent.show()
      break

    case 2:
      $newStudent.add($navPanel).hide()
      $newMessage.show()
      break

    default:
      $navPanel.show()
      $newStudent.add($newMessage).hide()
      break
  }
}

function checkMailer() {
  $("#jPanelMenu-menu .new_student").hide()
  $("#jPanelMenu-menu .new_message").hide()
  $("#jPanelMenu-menu .selector-email").on("change",function() {

    loadOption($(this).val())
  })
}
