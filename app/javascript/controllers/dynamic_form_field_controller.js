import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-form-field"
export default class extends Controller {
  static targets = [ "field" ]
  static values = {
    index: String
  }

  connect(){
    const newIndex = Math.floor(Date.now() / 1000);
    this.fieldTarget.name = this.fieldTarget.name.replace(this.indexValue, newIndex)
    this.fieldTarget.id = this.fieldTarget.id.replace(this.indexValue, newIndex)
  }
}