function showSearch(selectedElem) {
    var containers = document.getElementsByClassName("search-container");
    for (i = 0; i < containers.length; i++) {
      containers[i].style.display = "none";
    }

    document.getElementById(selectedElem).style.display = "block";
}