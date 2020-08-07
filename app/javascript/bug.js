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





// $('#bug_type').change(function(){

// 	//var city =state[$(this).val()];
// 	//var s = $("#bug_status").val(2);
// 	var s= $("select.bug_status").val(2);
// 	if(this.value==='bug'){

// 		s.value="resolved"
// 		s.text="resolved"
// 	}
// 	else{
// 		s.value="completed"
// 	 }
	
	
	
// });



});


// state = {"1":["Rome","Milan","Parma"],"2":["Paris","Lile","Nice"]}

//  $("#bug_type").on("change",function(e){
  	    
//           $("#bug_status").children().remove();
//           var city =series[$(this).val()];
//           if(!city) return;
//           $("#bug_status").append('<option value="">- Select -</option>')
//           for(i=0; i< city.length;i++) {
//             //console.log(city[i]);
//             $("#billing_town").append('<option value="'+city[i]+'">'+city[i]+'</option>');
//           }
          
//     });
  
//     // when changing country this alert country value itself
//     $("#billing_town").on("change",function(e){
//   	    alert($(this).val());
//     });

//     


   