window.onload = function() {
  // device name
  var playa_id = playa_getparam("agent_id");
  var playa_name = playa_getparam("agent_name");
  var playa_url = playa_getparam("agent_url");
  // back link
  var playa = document.createElement('div');
  playa.style.backgroundColor = "#eceff0";
  playa.style.width = "100%";
  playa.innerHTML = '<div style="padding: 10px;"><a style="text-decoration: none;" href="http://getplaya.com/">Playa</a> &#187; <a style="text-decoration: none;" href="'+playa_url+'">'+playa_name+'</a></div><div style="clear: both;">';
  body = document.getElementsByTagName("body")[0];
  first_child = body.firstChild;
  body.insertBefore(playa, first_child);
}

function playa_getparam(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
}