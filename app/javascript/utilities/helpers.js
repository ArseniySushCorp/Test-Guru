export const onLoad = (func) => document.addEventListener("turbolinks:load", func)

export const sortingNodes = () => {
  const tableBody = document.querySelector(".tests-table__tbody")

  return {
    tableBody,
    sortedBody: document.createElement("tbody"),
    sortedRows: Array.from(tableBody.querySelectorAll("tr")),
    upwardArrow: document.getElementById("arrow_upward"),
    downwardArrow: document.getElementById("arrow_downward")
  }
}

export const isHide = (nodeElement) => nodeElement.classList.contains("hide")
export const hide = (nodeElement) => nodeElement.classList.add("hide")
export const show = (nodeElement) => nodeElement.classList.remove("hide")

export const getTextContent = (nodeElement) => nodeElement.querySelector("td").textContent

export const addZero = (value) => String(value).padStart(2, "0")
