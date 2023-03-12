import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { put } from "@rails/request.js"

// Connects to data-controller="kanban"
export default class extends Controller {
  static targets = [ "column" ]
  static values = {
    group: String
  }

  connect() {
    this.setupSortable()
  }

  setupSortable() {
    this.columnTargets.forEach((column) => {
      new Sortable(column, {
        group: this.groupValue,
        onEnd: this.onEnd.bind(this)
      })
    })
  }

  onEnd(event) {
    const {from, to, oldIndex, newIndex, clone} = event

    put(clone.dataset.url, {
      responseKind: "turbo-stream",
      body: {
        kanban_column_id: to.dataset.columnId,
        position: newIndex + 1
      }
    })
  }
}

