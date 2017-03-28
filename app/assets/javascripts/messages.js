$(document).on('ready page:load', function() {
	fetchProductData()
});

function fetchProductData(){
	$.ajax({
	url: "https://yoda.p.mashape.com/yoda?sentence=You+will+learn+how+to+speak+like+me+someday.++Oh+wait.'",
	dataType: "jsonp",
	type: "GET",
	processData: false,
	contentType: "text/plain",
	success: function(data) {
		console.log(data)
		}
	});
};

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