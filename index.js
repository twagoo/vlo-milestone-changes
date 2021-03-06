var jp = require('jsonpath');
var Client = require('node-rest-client').Client;
var rest = require('rest');
var mime = require('rest/interceptor/mime');
var client = rest.wrap(mime);

var milestoneId = 7; 
var state = "all"; //open|closed|all

var req = {
	path: 'https://api.github.com/repos/clarin-eric/VLO/issues?milestone=' + milestoneId + '&state=' + state,
	headers: {
		'User-Agent': 'clarin-vlo-script'
	}
};
	

client(req).then(function(response) {
	var data = response.entity;
	var urls = jp.query(data, '$.*.html_url');
	var titles = jp.query(data, '$.*.title');
	
	for(i=0;i<urls.length;i++) {
		console.log('* ' + titles[i]);
		console.log('    <' + urls[i] + '>');
	}
});
