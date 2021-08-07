import { addZero } from "../helpers"

const showTimer = (control) => {
  let time = Number(control.dataset.timeLeft)

  const tick = setInterval(() => {
    if (time <= 0) {
      alert("Time is up!")

      return clearInterval(tick)
    }

    time--

    const seconds = addZero(time % 60)
    const minutes = addZero(Math.floor(time / 60))

    control.textContent = `${minutes}:${seconds}`
  }, 1000)
}

const init = () => {
  const control = document.querySelector(".test-timer")

  control && showTimer(control)
}

export default { init }
