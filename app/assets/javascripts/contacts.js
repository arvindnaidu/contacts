// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.MC = {};
MC.contactDetailPageHandlers = {};

$(function(){
  MC.contactDetailPageHandlers.newNoteEntryBox = $("#notes_tab_content .new-note-entry-box");
  MC.contactDetailPageHandlers.noteSearchBox = $("#notes_tab_content .note-search-box");
  MC.contactDetailPageHandlers.notesContainer = $("#notes_tab_content .notes-container");

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

  $("#contact_detail_page").on('click', '#notes_tab_content .show-new-note-entry', function(e){
    MC.contactDetailPageHandlers.noteSearchBox.addClass('hidden');
    MC.contactDetailPageHandlers.newNoteEntryBox.removeClass('hidden');
  });

  $("#contact_detail_page").on('click', '#notes_tab_content .delete-note', function(e){
    var selectedNotes = MC.contactDetailPageHandlers.notesContainer.find('.select-box:checked');
    console.log(selectedNotes.size());
  });

  $("#contact_detail_page").on('click', '#notes_tab_content .cancel-new-note', function(e){
    MC.contactDetailPageHandlers.newNoteEntryBox.find("textarea.note-text").val('');
    MC.contactDetailPageHandlers.newNoteEntryBox.addClass('hidden');
    MC.contactDetailPageHandlers.noteSearchBox.removeClass('hidden');
  });

  $("#contact_detail_page").on('click', "#notes_tab_content .save-new-note", function(e){
    e.preventDefault();
    var note = MC.contactDetailPageHandlers.newNoteEntryBox.find("textarea.note-text");
    $.ajax({
      type: 'post',
      url: $(this).attr('href'),
      data: {"note" : {"content" : note.val(), "color" : $("#colors-box .selected").data('color')}}
    })
    .done(function(response, textStatus, jqXhr){
      MC.contactDetailPageHandlers.notesContainer.prepend(response);
    });
    MC.contactDetailPageHandlers.newNoteEntryBox.find("textarea.note-text").val('');
    MC.contactDetailPageHandlers.newNoteEntryBox.addClass('hidden');
    MC.contactDetailPageHandlers.noteSearchBox.removeClass('hidden');
  });

  $("#contact_detail_page").on('change', '#notes_tab_content .select-all-notes', function(e){
    if( $(this).prop('checked') === true ){
      MC.contactDetailPageHandlers.notesContainer.find('input.select-box').prop('checked', true);
    }else{
      MC.contactDetailPageHandlers.notesContainer.find('input.select-box').prop('checked', false);
    }
  });

  $("#contact_detail_page").on('click', '#notes_tab_content .color-box', function(e){
    $(this).parent().find('.selected').removeClass('selected');
    $(this).addClass('selected');
  });

  $("#contact_detail_page").on('click', '#notes_tab_content .note-entry .note', function(e){
    $(this).addClass('hidden');
    $(this).prev().removeClass('hidden').focus();
  });

  $("#contact_detail_page").on('focusout', '#notes_tab_content .note-entry .update-note', function(e){
    var newText = $(this).val();
    var oldText = $(this).attr('placeholder');
    $(this).addClass('hidden');
    $(this).next().removeClass('hidden');
    if(newText !== oldText){
      $(this).next().html(newText);
      $.ajax({
        type: 'put',
        url: $(this).data('href'),
        data: {"content" : newText}
      });
    }
  });

})
