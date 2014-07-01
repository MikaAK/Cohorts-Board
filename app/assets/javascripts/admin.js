$(function() {
  checkMailer()

  $(function() {
    $('.datepicker').datepicker();
  });
});

function loadOption(value) {
  $newStudent = $("#jPanelMenu-menu .new_student")
  $newMessage = $("#jPanelMenu-menu .new_message")
  $navPanel = $('#jPanelMenu-menu .nav-panel')
  $newStudent2 = $("#jPanelMenu-menu .edit_student")

  switch(parseInt(value)) {
    case 1:
      $newMessage.add($navPanel).hide()
      $newStudent.add($newStudent2).show()
      break

    case 2:
      $newStudent.add($navPanel).add($newStudent2).hide()
      $newMessage.show()
      break

    default:
      $navPanel.show()
      $newStudent.add($newMessage).add($newStudent2).hide()
      break
  }
}

function checkMailer() {
  $("#jPanelMenu-menu .new_student").hide()
  $("#jPanelMenu-menu .new_message").hide()
  $("#jPanelMenu-menu .edit_student").hide()

  $("#jPanelMenu-menu .selector-email").on("change",function() {

    loadOption($(this).val())
  })
}
