<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <body> -->
<!-- <footer class="footer-container text-center"> -->
<!--   <div class="container"> -->
<!--     <div class="row"> -->
<!--       <div class="col-xs-12"> -->
<!--         <p>Š UNTITLED | Website created with <a href="http://www.mashup-template.com/" title="Create website with free html template">Dead Lock</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Soldesk</a></p> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </footer> -->


<script>
document.getElementById("myBtn").click();
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function likeFunction(x) {
    x.style.fontWeight = "bold";
    x.innerHTML = "✓ Liked";
}
</script>

</body>
</html>