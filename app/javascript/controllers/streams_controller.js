import { Controller } from "@hotwired/stimulus"
import { get, destroy } from "@rails/request.js"

// Connects to data-controller="streams"
export default class extends Controller {
  static values = { url: String }
  static targets = [ "container" ]

  async getRequest() {
    await get(this.urlValue)
  }

  async destroyRequest() {
    await destroy(this.urlValue)
  }
}