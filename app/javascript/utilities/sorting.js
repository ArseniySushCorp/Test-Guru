document.addEventListener("turbolinks:load", () => {
  const control = document.querySelector(".tests-table__title")

  control && control.addEventListener("click", sortRowsByTitle)
})

const tableNodeElements = () => {
  const tableBody = document.querySelector(".tests-table__tbody")

  console.log(tableBody)

  return {
    tableBody,
    sortedBody: document.createElement("tbody"),
    sortedRows: Array.from(tableBody.querySelectorAll("tr")),
    upwardArrow: document.getElementById("arrow_upward"),
    downwardArrow: document.getElementById("arrow_downward")
  }
}

const isHide = (nodeElement) => nodeElement.classList.contains("hide")
const hide = (nodeElement) => nodeElement.classList.add("hide")
const show = (nodeElement) => nodeElement.classList.remove("hide")

const sortRowsByTitle = () => {
  const { sortedRows, tableBody, sortedBody, upwardArrow, downwardArrow } = tableNodeElements()
  sortedBody.classList.add("tests-table__tbody")

  if (isHide(upwardArrow)) {
    sortedRows.sort(compareRowsAsc)
    show(upwardArrow)
    hide(downwardArrow)
  } else {
    sortedRows.sort(compareRowsDesc)
    show(downwardArrow)
    hide(upwardArrow)
  }

  console.log(sortedRows)
  sortedRows.forEach((row) => sortedBody.appendChild(row))

  tableBody.parentNode.replaceChild(sortedBody, tableBody)
}

const getTextContent = (nodeElement) => nodeElement.querySelector("td").textContent

function compareRowsAsc(current, next) {
  const currentTitle = getTextContent(current)
  const nextTitle = getTextContent(next)

  if (currentTitle < nextTitle) {
    return -1
  }

  if (currentTitle > nextTitle) {
    return 1
  }

  return 0
}

function compareRowsDesc(current, next) {
  const currentTitle = getTextContent(current)
  const nextTitle = getTextContent(next)

  if (currentTitle < nextTitle) {
    return 1
  }

  if (currentTitle > nextTitle) {
    return -1
  }

  return 0
}
