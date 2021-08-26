const calculateProgress = (progressBar) => {
  const percents = Math.round((progressBar.dataset.current * 100) / progressBar.dataset.amount) + "%"

  progressBar.style.width = percents
}

const init = () => {
  const control = document.querySelector(".determinate")

  if (control) calculateProgress(control)
}

export default { init }
