// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"
import "./controllers"

import { StreamActions } from "@hotwired/turbo"

StreamActions.analytics = function() {
  const event = this.getAttribute("event")
  window.beam(`/custom-events/${event}`)
}

