function setCookie(c_name,value,exdays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate() + exdays);
var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
document.cookie=c_name + "=" + c_value;
}
function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
{
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}
 
$(document).ready(function() {
 
	var okno = '<div class="cookie">Strona korzysta z plików cookies w celu realizacji usług i zgodnie z <a href="polityka-prywatnosci" class="link_c">Polityką Plików Cookies.</a> Możesz określić warunki przechowywania lub dostępu do plików cookies w Twojej przeglądarce. <img src="./../images/iks.png" class="cookie-x" alt="Zamknij" /></div>';
 
	var ciacho = getCookie('cookie');
	if(ciacho != 1) {
		$('body').append(okno);
	}
 
	$('.cookie-x').click(function() {
		$('.cookie').fadeOut('slow');
		setCookie('cookie', 1, 365);
	});
});