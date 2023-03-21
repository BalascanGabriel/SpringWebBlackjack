  console.log("Script loaded");
  
const changeUsernameLink = document.getElementById("change-username-link");
const changePasswordLink = document.getElementById("change-password-link");
const depositLink = document.getElementById("deposit-link");
const withdrawLink = document.getElementById("withdraw-link");
const changeUsernameForm = document.getElementById("change-username");
const changePasswordForm = document.getElementById("change-password");
const depositForm = document.getElementById("deposit");
const withdrawForm = document.getElementById("withdraw");

// Add click event listeners to the links
changeUsernameLink.addEventListener("click", (event) => {
  event.preventDefault();
  hideAllForms();
  changeUsernameForm.style.display = "block";
});

changePasswordLink.addEventListener("click", (event) => {
  event.preventDefault();
  hideAllForms();
  changePasswordForm.style.display = "block";
});

depositLink.addEventListener("click", (event) => {
  event.preventDefault();
  hideAllForms();
  depositForm.style.display = "block";
});

withdrawLink.addEventListener("click", (event) => {
  event.preventDefault();
  hideAllForms();
  withdrawForm.style.display = "block";
});

// Function to hide all forms
function hideAllForms() {
  changeUsernameForm.style.display = "none";
  changePasswordForm.style.display = "none";
  depositForm.style.display = "none";
  withdrawForm.style.display = "none";
}
