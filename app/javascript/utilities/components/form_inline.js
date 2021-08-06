import { isHide, hide, show } from "../helpers"

export const formInlineLinkHandler = (event) => {
  event.preventDefault()

  const testId = event.target.dataset.testId
  formInlineHandler(testId)
}

export const formInlineHandler = (testId) => {
  const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
  const editLink = document.querySelector(`.form-inline-btn[data-test-id="${testId}"]`).parentNode
  const cancelBtn = document.querySelector(`.form-inline__cancel-btn[data-test-id="${testId}"]`)

  const showForm = () => {
    hide(testTitle)

    show(formInline)
    hide(editLink)
  }

  const hideForm = () => {
    show(testTitle)
    show(editLink)

    hide(formInline)
  }

  cancelBtn.onclick = () => hideForm()

  isHide(formInline) ? showForm() : hideForm()
}
