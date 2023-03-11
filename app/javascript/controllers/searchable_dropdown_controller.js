import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="searchable-dropdown"
export default class extends Controller {
  static values = {
    url: String,
    attribute: String
  }
  
  connect() {
    this.selected = new Set()
    this.setupEventListener()
  }

  change(e) {
    get(`${this.urlValue}?${this.attributeValue}=${e.target.value}`, {
      responseKind: "turbo-stream"
    })
  }

  select(e) {
    const ingredient = e.target.value

    if (e.target.checked) {
      this.selected.add(ingredient)
    } else {
      this.selected.delete(ingredient)
    }
  }

  setupEventListener() {
    document.addEventListener("turbo:before-stream-render", (event) => {
      const turboStreamElement = event.target
      const {action, target} = turboStreamElement
      const template = turboStreamElement.firstElementChild
      
      if (action === 'update') {
        template.content.querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
          if (this.selected.has(checkbox.value)) {
            checkbox.checked = true
          }
        })
      }
    })
  }
}


