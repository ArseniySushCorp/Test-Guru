import PasswordsMatch from "./utilities/passwordsMatch"
import sortRowsByTitle from "./utilities/sorting"

document.addEventListener("turbolinks:load", () => {
  if (window.location.href.includes("sign_up")) new PasswordsMatch()
})

document.addEventListener("turbolinks:load", () => {
  const control = document.querySelector(".tests-table__title")

  if (control) control.addEventListener("click", sortRowsByTitle)
})
