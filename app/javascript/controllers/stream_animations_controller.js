import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.setupEventListener()
  }

  setupEventListener() {
    document.addEventListener("turbo:before-stream-render", (event) => {
      const turboStreamElement = event.target
      const {action, target} = turboStreamElement
      const template = turboStreamElement.firstElementChild
      
      // <turbo-stream action="append" target="some_id">
      if (action === 'append') {
        const {enteringClass} = template.content.firstElementChild.dataset
    
        if (enteringClass) {
          template.content.firstElementChild.classList.add(enteringClass)
        }
      }
      
      // <turbo-stream action="remove" target="some_id">
      if (action === "remove") {
        const targetToRemove = document.getElementById(target)
        const {leavingClass} = targetToRemove.dataset
    
        if (leavingClass) {
          event.preventDefault()
          targetToRemove.classList.add(leavingClass)
          targetToRemove.addEventListener("animationend", () => {
            event.target.performAction()
          })
        }
      }
    })
  }
}