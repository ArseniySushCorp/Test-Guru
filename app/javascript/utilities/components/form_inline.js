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
  const initialValue = formInline.value

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
