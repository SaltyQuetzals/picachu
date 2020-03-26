function showSearch(elemType) {
    containers = document.getElementsByClassName("search-container");
    tabs = document.getElementsByClassName("radio-label");

    for (i = 0; i < containers.length; i++) {
      containers[i].style.display = "none";
      tabs[i].classList.remove("active");
    }

    document.getElementById("search"+elemType).style.display = "block";
    document.getElementById("label"+elemType).className += " active";
}