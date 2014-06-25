$(document).ready(function() {
  checkMailer()
})

function loadMailer(index) {
  $newStudent = $("#new_student")
  $newMessage = $("#new_message")

  switch(index) {
    case 1:
      $newMessage.css('display', 'none')
      $newStudent.css('display', 'block')
      break
    case 2:
      console.log('2')
      $newStudent.css('display', 'none')
      $newMessage.css('display', 'block')
      break
    default:
      $newStudent.css('display', 'none')
      $newMessage.css('display', 'none')
      break
  }
}

function checkMailer() {
  $("#new_student").css('display', 'none')
  $("#new_message").css('display', 'none')

  $(document).on("change","#selector-email",function() {
     loadMailer($('option:selected',this).index())
  })
}
