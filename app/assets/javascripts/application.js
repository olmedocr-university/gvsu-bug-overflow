// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require js-routes
//= require_tree .

// Set up a dummy function so we don't pollute the global namespace
(function () {
    "use strict";

    var insertAuthors = function(authors) {

        var list = document.getElementById("authorList");
        list.getElementsByClassName("noneMarker")[0].hidden = true;
        authors.forEach(function(author){
            var newLI = document.createElement("li");
            var newText = document.createTextNode(author.lname + ", " + author.fname + ": " + author.email);
            newLI.appendChild(newText);
            list.appendChild(newLI);
        });
    };

    var loadAuthors = function () {
        var ajax = new XMLHttpRequest();
        console.log("Click!");

        ajax.open("GET", Routes.users_path({format: "json"}));
        ajax.onreadystatechange = function () {
            console.log("Ajax state: " + ajax.readyState);
            if (ajax.readyState === 4 && ajax.status === 200) {
                console.log("Complete AJAX object:");
                console.log(ajax);
                var authors = JSON.parse(ajax.responseText);
                console.log("Parsed JSON");
                console.log(authors);
                insertAuthors(authors);
            } else if (ajax.readyState === 4 && ajax.status !== 200) {
                console.log("There was a problem.  Status returned was " + ajax.status);
            }
        };

        ajax.onerror = function () {
            console.log("There was an error!");
        };

        // Notice that send is asynchronous.  This method does not block,
        // instead, the code in onreadystatechange above runs when the call
        // is complete.
        ajax.send();
    };

    // Don't apply the event listeners until the document has loaded.
    document.addEventListener("readystatechange", function () {
        console.log("Ready:  " + document.readyState);
        if (document.readyState === "interactive") {
            var loadButton = document.getElementById("loadButton");
            loadButton.addEventListener("click", loadAuthors);
        }
    });
})();
