$(document).ready(function() {
  
	$('.arccodian').on('click', '.panel', function(event) {
	    this.toggle(function() {
	      this.hide();
	    }, function() {
	      this.show();
	    });
	});
	
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
      acc[i].onclick = function() {
          this.classList.toggle("active");
          var panel = this.nextElementSibling;
          if (panel.style.maxHeight){
            panel.style.maxHeight = null;
          } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
          }
        }
      }

  
});
