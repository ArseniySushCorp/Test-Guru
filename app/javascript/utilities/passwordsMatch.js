document.addEventListener("turbolinks:load", () => {
  if (window.location.href.includes("sign_up")) new passwordsMatch()
})

export default class passwordsMatch {
  constructor() {
    this.form = document.getElementById("new_user")
    this.password = document.getElementById("user_password")
    this.passwordConfirmation = document.getElementById("user_password_confirmation")

    this.init()
  }
  clear() {
    this.passwordConfirmation.classList.remove("valid")
    this.passwordConfirmation.classList.remove("invalid")
  }
  checkPassword() {
    this.clear()
    if (this.passwordConfirmation.value === this.password.value) {
      this.passwordConfirmation.classList.add("valid")
    } else {
      this.passwordConfirmation.classList.add("invalid")
    }
  }
  init() {
    this.form.addEventListener("keyup", () => {
      if (this.password.value !== "") this.checkPassword()
    })
  }
}
