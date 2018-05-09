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
//= require jquery
//= require jquery.turbolinks
//= require jquery_nested_form
//= require featherlight.min.js
//= require_tree .


	function keisan(){
		var tbl = document.getElementById(id="table");
		var rows = tbl.rows;
		var total = 0;
		for (var i = 1, rowlen = rows.length; i < rowlen; i++) {
			var qty = parseInt($('#qty' + `${i - 1}`).val());
			// console.log(qty);
			var col = tbl.rows[i].cells[1].innerText;
			var cost = Number(col);
			var price = qty * cost;
			// console.log(cost);
			document.getElementById("field" + `${i - 1}`).innerText = price.toLocaleString();
			// console.log(price);
			var total = total + price;
		}
			document.getElementById("field_total").innerText = (total + 510).toLocaleString();
			document.getElementById("sum").value = total + 510;
			document.getElementById("amount").value = total + 510;
	}


	function entryChange2(){
		if(document.getElementById('changeSelect')){
			id = document.getElementById('changeSelect').value;

			if(id == 'クレジット'){
				//フォーム
				document.getElementById('creditBox').style.display = "";
			}else{
				document.getElementById('creditBox').style.display = "none";
			}
		}
	}

	//オンロードさせ、リロード時に選択を保持
	window.onload = entryChange2;