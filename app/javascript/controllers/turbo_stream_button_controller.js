import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template-manager"
export default class extends Controller {
  static targets = [ "turboStreams" ]

  evaluate({ target }) {
    if (target instanceof Element) {
      for (const { content } of this.turboStreamsTargets) {
        target.append(content.cloneNode(true));
      }
    }
  }
}