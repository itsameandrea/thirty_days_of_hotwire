import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="command-palette"
export default class extends Controller {
  static targets = [ "palette", "input" ]

  isVisible() {
    return !this.paletteTarget.className.includes("hidden")
  }

  toggle() {
    this.paletteTarget.classList.toggle("hidden")
    
    if (this.isVisible()) {
      this.inputTarget.value = ""
      this.inputTarget.focus()
    }
  }

  close() {
    this.paletteTarget.classList.add("hidden")
  }
}



