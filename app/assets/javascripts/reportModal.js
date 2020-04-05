
const modal = document.getElementById("report-modal");


const closeModal = () => {

    window.history.back();
};

const requireOtherInputIfNeeded = (radioButton) => {
    const reasonForOther = document.getElementById("reasonForOther");
    if (radioButton.value === "other") {
        reasonForOther.required = true;
        reasonForOther.disabled = false;
    } else {
        reasonForOther.required = false;
        reasonForOther.disabled = true;
        reasonForOther.value = "";
    }
};

// If focus leaves the modal, close it
window.onclick = function (event) {
    if (event.target === modal) {   
        closeModal();
    }
};

document.getElementById("close-modal-btn").addEventListener("click", closeModal);


const form = document.getElementById("reportForm");

// If reporting failed, let them know why
form.addEventListener("ajax:error", (event) => {
    const [_data, _status, _xhr] = event.detail;
    // alert(_data);
});
