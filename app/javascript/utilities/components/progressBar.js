const calculateProgress = (progressBar) => {
  const percents = Math.round((progressBar.dataset.current * 100) / progressBar.dataset.amount) + "%"

  progressBar.style.width = percents
}

export default calculateProgress
