console.log("linked");
$(document).ready(function(){
  var full_width = $(window).width();
  var full_height = $(window).height();
  $('.modal_window').each(function(){
    var modal_height = $(this).outerHeight();
    var modal_width = $(this).outerWidth();
    var modal_top = (full_height-modal_height)/2;
    var modal_left = (full_width-modal_width)/2;
    $(this).css({'top' : modal_top , 'left' : modal_left});
  });
  $('.activate_modal').click(function(){
    var modal_id = $(this).attr('name');
    show_modal(modal_id);
  });
  $('.close_modal').click(function(){
    close_modal();
  });
});

function show_modal(modal_id){
  $('#mask').css({ 'display' : 'block', opacity : 0});
  $('#mask').fadeTo(500,0.8);
  $('#'+modal_id).fadeIn(500);
}

function close_modal(){
  $('#mask').fadeOut(500);
  $('.modal_window').fadeOut(500);
}
