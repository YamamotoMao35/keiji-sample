window.onload = function(){
  setInterval(function(){
    var dd = new Date();
    document.getElementById("Moment").innerHTML = dd.toLocaleString();
  }, 1000);
}