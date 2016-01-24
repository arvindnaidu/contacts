// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $(document).on('click', 'a.delete-contact', function(e){
    e.preventDefault();
    var currentElement = $(this);

    $.ajax({
      type: 'DELETE',
      url: currentElement.attr('href'),
      dataType: 'json'
    })
    .done(function(response, textStatus, jqXhr){
      location.href = response.redirectToUrl;
    })
  });
})
