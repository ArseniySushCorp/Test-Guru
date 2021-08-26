import { isHide, hide, show } from "../helpers"

const formInlineLinkHandler = (event) => {
  event.preventDefault()

  const testId = event.target.dataset.testId
  formInlineHandler(testId)
}

const formInlineHandler = (testId) => {
  const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
  const editLink = document.querySelector(`.form-inline-btn[data-test-id="${testId}"]`).parentNode

  const showForm = () => {
    show(formInline)

    hide(testTitle)
    hide(editLink)
  }

  const hideForm = () => {
    show(testTitle)
    show(editLink)

    hide(formInline)
  }

  isHide(formInline) ? showForm() : hideForm()
}

const init = () => {
  const controls = document.querySelectorAll(".form-inline-btn")

  if (controls.length) {
    controls.forEach((control) => control.addEventListener("click", formInlineLinkHandler))
  }

  const errors = document.querySelector(".resource-errors")

  if (errors) {
    const resourceId = errors.dataset.resourceId

    formInlineHandler(resourceId)
  }
}

export default { init }
