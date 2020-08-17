function myFunc() {
  var series = [ ['New', 'Started' ,'Resolved'],['New', 'Started' ,'Completed']];
  var x = document.getElementById("project_type").selectedIndex;
  var option="";
  var i;
  for (i = 0; i < series[x].length; i++) {
    option += '<option value="'+series[x][i]+'"'+'>'+series[x][i]+'</option>';
  }
  document.getElementById("project_status").innerHTML=option;
}


$('document').ready(function(){

  $('#project_deadline').datepicker({

	  dateFormat: 'yy-mm-dd'
	});
});
