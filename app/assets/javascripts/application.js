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
//= require rails-ujs
//= require activestorage

//=require dash/core/jquery.min
//=require dash/core/popper.min
//=require dash/core/bootstrap.min
//=require dash/plugins/perfect-scrollbar.jquery.min
//=require dash/plugins/chartjs.min
//=require dash/plugins/bootstrap-notify
//=require dash/paper-dashboard.min
//= require toastr
//= require turbolinks
//= require_tree .



// função setada para atualizar valor dotz no purchases
window.onload = startInterval;
function startInterval() {
    setInterval("calcular();",100);
}

function calcular() {
	var x=0;
  var n1 = parseInt(document.getElementById('n1').value, 10);
  var n2 = parseInt( $('#n2').html(), 10);
	if (isNaN(n1)|| isNaN(n2)) {

	  document.getElementById('resultado').innerHTML = x;
	} else {
	   document.getElementById('resultado').innerHTML = n1 * n2;
	}
  
}	


function searchJScode() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("div");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("p")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}