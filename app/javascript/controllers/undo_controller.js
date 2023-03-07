import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="undo"
export default class extends Controller {
  static targets = ["actions", "countdown", "content"]
  static values = { seconds: { type: Number, default: 5 } }
  
  disconnect() {
    clearInterval(this.interval)
  }

  start(e) {
    if (this.contentTarget.value.length) {
      e.preventDefault()

      this.showActions()
      this.startCountdown()
    }
  }

  startCountdown() {
    this.countdownTarget.textContent = this.secondsValue
    this.interval = setInterval(() => {
      this.secondsValue -= 1

      this.countdownTarget.textContent = this.secondsValue
      console.log('Hello')
      if (this.secondsValue === 0) {
        this.element.requestSubmit()
      }
    }, 1000)
  }

  showActions() {
    this.actionsTarget.parentElement.innerHTML = this.actionsTarget.innerHTML
  }
}

