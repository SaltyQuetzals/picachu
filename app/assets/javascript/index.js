var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
var rad1 = document.getElementById("radio1");
var rad2 = document.getElementById("radio2");
var rad3 = document.getElementById("radio3"); 
var otherInput = document.getElementById("other_input");
var submit_review = document.getElementById("submitReview");

var rad1_selected;
var rad2_selected;
var rad3_selected;
var otherReportValue; // this will store other value in report review dialog

rad1.onclick = function() {
  rad1.checked = true;
  rad1_selected = true;
  rad2.checked = false;
  rad2_selected = false;
  rad3.checked = false;
  rad3_selected = false;
}

rad2.onclick = function() {
  rad1.checked = false;
  rad1_selected = false;
  rad2.checked = true;
  rad2_selected = true;
  rad3.checked = false;
  rad3_selected = false;
}

rad3.onclick = function() {
  rad1.checked = false;
  rad1_selected = false;
  rad2.checked = false;
  rad2_selected = false;
  rad3.checked = true;
  rad3_selected = true;
}

otherInput.onclick = function() {
  rad1.checked = false;
  rad1_selected = false;
  rad2.checked = false;
  rad2_selected = false;
  rad3.checked = true;
  rad3_selected = true;
}


// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

submit_review.onclick = function() {
  //logic to save record.
  //other test condition
  if(otherInput.value == "" && rad3_selected == true)
  {
  	alert("Please Specify for 'Other' Option.")
  	return;
  }

  otherReportValue = otherInput.value;
  otherInput.value = "";
  modal.style.display = "none";
  history.back();

}





