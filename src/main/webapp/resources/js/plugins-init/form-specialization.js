document.addEventListener("DOMContentLoaded", function () {

    const technician = document.querySelector("#technician").firstElementChild;
    const spec = document.querySelector("#spec");
    console.log(technician);
    console.log(spec);

    technician.addEventListener('focus', evt => {
        if (technician.checked){
            spec.style.display = 'none';
        }else {
            spec.style.display = 'block';
        }
    });
});