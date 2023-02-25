import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "field" ]

  remove(){
    this.element.remove()
  }
}