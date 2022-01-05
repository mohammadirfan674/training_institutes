function getElementByIdOrName(idOrName) {
var ele = document.getElementById(idOrName);
if (!ele) {
var btn = document.getElementsByName(idOrName);
if (btn) {
ele = btn[0];
}
}
if (!ele) {
var attr = document.querySelector(idOrName);
if (attr) {
ele = attr;
}
}

return ele;
}


//===========================================================================================================


//-------zoopim chat integration----------------------

var waitForZopim = setInterval(function () {
    if (window.$zopim === undefined || window.$zopim.livechat === undefined) {
        return;
    }
    $zopim(function() {
        $zopim.livechat.setOnChatStart(callback);
    });
    clearInterval(waitForZopim);
}, 100);
   

 function callback() {

 	var name = $zopim.livechat.getName();
 	console.log(name);
 	var email = $zopim.livechat.getEmail();
 	console.log(email);
 	var phone = $zopim.livechat.getPhone();
 	console.log(phone);
 	const params = {
 		Email: email,
 		MobileNumber: phone,
 		FirstName: name,
 		"AuthToken": "ALLEN-06-02-2019",
		 "Source": "allen",	
		 "LeadSource" :"Chat",
		"LeadName" : "OLTS-Chat",
		"ReferredToEmail":"pankaj.rawlani@allen.in",
		"LeadType" : "OLTS - WEB-Chat",
		"Course" : "OLTS",
		"Entity4" : "DLP",
		"Field1" : "DISTANCE LEARNING"
 	}

 	const http = new XMLHttpRequest()
 	http.open('POST', 'https://prodapi.extraaedge.com/api/WebHook/add', false)
 	http.setRequestHeader('Content-type', 'application/json')
 	http.send(JSON.stringify(params)) // Make sure to stringify
 	http.onload = function () {
 		console.log(http.responseText)
 	}
 }

//------------------------------------------------------------------------------