document.addEventListener("DOMContentLoaded", function () {

    let tech = document.querySelector("#tech");
    let spec = document.querySelector("#spec");
    console.log(tech);
    console.log(spec);

    if (tech.checked) {
        spec.style.visibility = 'visible';
    } else {
        spec.style.visable = 'hidden';
    }
});