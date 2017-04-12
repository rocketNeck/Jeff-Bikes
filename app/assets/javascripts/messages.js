$(document).ready(function() {
  $('.new_message').on('submit', function(e){
    e.preventDefault()

    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        debugger
      }
    })
  })
})
