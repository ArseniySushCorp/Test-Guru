import PasswordsMatch from "./components/passwordsMatch"
import sortRowsByTitle from "./components/sorting"
import { formInlineLinkHandler, formInlineHandler } from "./components/form_inline"
import calculateProgress from "./components/progressBar"

import { onLoad } from "./helpers"

onLoad(() => window.location.href.includes("sign_up") && new PasswordsMatch())

onLoad(() => {
  const control = document.querySelector(".tests-table__title")

  if (control) control.onclick = sortRowsByTitle
})

onLoad(() => {
  const controls = document.querySelectorAll(".form-inline-btn")

  if (controls.length) {
    controls.forEach((control) => control.addEventListener("click", formInlineLinkHandler))
  }

  const errors = document.querySelector(".resource-errors")

  if (errors) {
    const resourceId = errors.dataset.resourceId

    formInlineHandler(resourceId)
  }
})

onLoad(() => {
  const control = document.querySelector(".determinate")

  if (control) calculateProgress(control)
})
