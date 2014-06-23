$(document).ready(function() {
  proccessedChecked()
})

function proccessedChecked() {
  $checkbox = $("input[type='checkbox']")
  $studentArea = $(".inquire-students");

  $checkbox.click(function(){
    ticked = checkTicked()
    $studentArea.val(ticked)
    listTicked(ticked)
  })
}

function checkTicked() {
  array = []
  $("input[type='checkbox']:checked + h4").each(function(index,value){
    array.push($(value).data('student-name'))
  })
  return array
}

function listTicked(checked) {
  $studentList = $('.selected-students')
  if(checked.length > 0) {
    $studentList.empty()
    $studentList.append("<h4 class='selected-title'>Selected Students</h4>")
    $(checked).each(function(index, value) {
      $studentList.append("<li class='student-name'>" + value + '</li>')
    })
  } else {
    $studentList.empty()
  }
}
