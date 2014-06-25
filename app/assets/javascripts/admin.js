$(document).ready(function() {
  mailerChange()
})

function checkMailer() {
  selectMailer = document.getElementById("selector-email")

  switch(selectMailer.options[selectMailer.selectedIndex].value) {
    case 1:
      console.log('hit1')
      selectMailer.after("#{j(= render 'forms/invite_student')}")
      break
    case 2:
      console.log('hit2')
      selectMailer.after("#{j(= render 'forms/invite_visitor')}")
      break
  }
}

function mailerChange() {
  $("#selector-email").change(function() {
    console.log($('#selector-email')[0].selectedIndex)
  })
}
