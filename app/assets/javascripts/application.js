// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require websocket_rails/main

console.log("yona")

var dispatcher = new WebSocketRails('localhost:3000/websocket');


dispatcher.on_open = function(data) {
    console.log('Connection has been established: ', data);
    // You can trigger new server events inside this callback if you wish.
}

var comment = {
    title: 'This post was awful',
    body: 'really awful',
    post_id: 9
}

dispatcher.trigger('map_searches.new_tester', comment);

