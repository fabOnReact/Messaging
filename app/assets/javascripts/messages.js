$(document).on('ready page:load', function() {
	fetchProductData()
});

function fetchProductData(){
	$.ajax({
	url: "https://yoda.p.mashape.com/yoda?sentence=You+will+learn+how+to+speak+like+me+someday.++Oh+wait.'",
	dataType: "jsonp",
	type: "GET",
	processData: false,
	contentType: "application/json",
	success: function(data) {
		console.log(data)
		}
	});
};

$.ajax({
    url: 'https://yoda.p.mashape.com/yoda', // The URL to the API. You can get this by clicking on "Show CURL example" from an API profile
    type: 'GET', // The HTTP Method
    data: {sentence: $("#boxArea").val()}, // Additional parameters here
    datatype: 'json',
    success: function (data) {
        alert(data);
    },
    error: function (err) {
        alert(err);
    },
    beforeSend: function (xhr) {
        xhr.setRequestHeader("X-Mashape-Authorization", "<RvyROurVRvmshRzDcAtXABdytvkDp1MtroWjsnXo8Dcs9Dq6SB>"); // Enter here your Mashape key
    }
});});});

/*

$(document).on('ready page:load', function() {
	function fetchProductData(id){
		$.ajax({
		url: "http://localhost:3000/products/" + id + ".js",
		dataType: "jsonp",
		type: "GET",
		processData: false,
		contentType: "application/json",
		success: function(data) {
			$('#' + id).
			append('<li>Remote id: ' + id + '</li>').
			append('<li>Reference: ' + data['product']['reference'] + '</li>').
			append('<li>Quantity: ' + data['product']['quantity'] + '</li>');
			}
		});
	};
});

*/