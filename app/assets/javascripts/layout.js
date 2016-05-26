$(document).ready(function(){
  // highlight active category tab
  var url = window.location.pathname
  $link = $('a[href$="'+url+'"]')
  $link.addClass('active')
})
