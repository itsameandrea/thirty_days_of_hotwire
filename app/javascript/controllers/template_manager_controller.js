import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template-manager"
export default class extends Controller {
  static targets = [ "container", "template" ]

  append(){
    this.containerTarget.appendChild(this.clone());
  }

  clone(){
    return this.templateTarget.content.cloneNode(true)
  }
}