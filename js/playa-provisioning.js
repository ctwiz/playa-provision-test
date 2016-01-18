window.onload = function() {
  // device name
  var id = playa_getparam("agent_id");
  var name = playa_getparam("agent_name");
  // back link
  var playa = document.createElement('div');
  playa.style.backgroundColor = "#eceff0";
  playa.style.padding = "10px";
  playa.style.width = "100%";
  playa.innerHTML = '<div><a style="text-decoration: none;" href="http://getplaya.com/">Playa</a> &#187; <a style="text-decoration: none;" href="http://getplaya.com/device/'+id+'">'+name+'</a></div><div style="clear: both;">';
  body = document.getElementsByTagName("body")[0];
  first_child = body.firstChild;
  body.insertBefore(playa, first_child);
}

function playa_getparam(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
}