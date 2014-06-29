$(function () {
  selectionChange()
})

function selectionChange() {
  $selectUser = $('#user')
  $loginForm = $("form[method='get']")

  $loginForm.find(':input').prop('disabled', true)

  $selectUser.on('change', function() {
    switch($selectUser.val()) {
    case 'Student':
      $loginForm.find(':input').prop('disabled', false)
      break

    case 'Employer':
      $loginForm.find(':input').prop('disabled', false)
      break

    default:
      $loginForm.find(':input').prop('disabled', true)
    }
    submitForm()
  })
}

function submitForm() {
  user = $('#user').val().toLowerCase()

  $('input[type=submit]').click(function() {
    $("form[method='get']").attr('action', '/' + user + 's/authenticate/' + getUUID())
  })
}

function getUUID() {
  return $("#uuid").val()
}
