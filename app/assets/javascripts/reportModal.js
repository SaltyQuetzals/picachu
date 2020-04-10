const modal = document.getElementById("report-modal");
const openModal = () => {
    modal.style.display = "block";
};
const closeModal = () => {
    modal.style.display = "none";
};
const checkAndCloseModal = () => {
    if(reasonForOther.required === true && reasonForOther.value !== "") {
        closeModal();
    }
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
document.getElementById("reportReview").addEventListener("click", checkAndCloseModal);


const form = document.getElementById("reportForm");
