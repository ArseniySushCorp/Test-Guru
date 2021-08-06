import PasswordsMatch from "./components/passwordsMatch"
import sortRowsByTitle from "./components/sorting"
import { formInlineLinkHandler, formInlineHandler } from "./components/form_inline"

document.addEventListener("turbolinks:load", () => {
  if (window.location.href.includes("sign_up")) new PasswordsMatch()
})

document.addEventListener("turbolinks:load", () => {
  const control = document.querySelector(".tests-table__title")

  if (control) control.addEventListener("click", sortRowsByTitle)
})

document.addEventListener("turbolinks:load", () => {
  const controls = document.querySelectorAll(".form-inline-btn")

  if (controls.length) {
    controls.forEach((control) => {
      control.addEventListener("click", formInlineLinkHandler)
    })
  }

  const errors = document.querySelector(".resource-errors")

  if (errors) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})
