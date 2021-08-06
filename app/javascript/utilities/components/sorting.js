import { sortingNodes, isHide, hide, show, getTextContent } from "../helpers"

const sortRowsByTitle = () => {
  const { sortedRows, tableBody, sortedBody, upwardArrow, downwardArrow } = sortingNodes()
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

  sortedRows.forEach((row) => sortedBody.appendChild(row))

  tableBody.parentNode.replaceChild(sortedBody, tableBody)
}

const compareRowsAsc = (current, next) => {
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

const compareRowsDesc = (current, next) => {
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

export default sortRowsByTitle
