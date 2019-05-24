function sendMessage() {
  let formElement = document.querySelector("#my-form");
  let form = $(formElement);
  let data = getData();
  $.ajax({
    url: '/contact',
    type: 'POST',
    data: { contact: data },
    success: function () {
      messagePopup('success', 'Message was successfully delivered!')
    },
    error: function () {
      messagePopup('error', 'Message delivery failed!')
    }
  });

  function getData() {
    let dataArray = form.serializeArray();
    let transformedData = {};
    dataArray.map((value) => {
      transformedData[value.name] = value.value;
    });
    return transformedData;
  }
}

function messagePopup(type, message) {
  let popup = $('#popup').text(message)
  if (type === 'success') {
    popup.addClass('message submit_success')
    $('input[type=email]')[0].value = ''
    $('input[type=text]')[0].value = ''
  } else if (type === 'error') {
    popup.addClass('message submit_error')
  }

  popup.slideDown(500, function () {
    setTimeout(function () {
      $(this).show();
      popup.slideUp(500, function () {
      });
    }, 3000)
  })
}