import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'


// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["calendar", "event"]
  
  initialize() {
    this.setupCalendar()
  }

  setupCalendar() {
    this.calendar = new Calendar(this.calendarTarget, {
      plugins: [ dayGridPlugin ],
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title'
      }
    })

    this.calendar.render()
  }

  eventTargetConnected(event) {
    const { id, title, startingAt: start } = event.dataset

    if (this.calendar) {
      const event = {
        id,
        title,
        start: new Date(start),
      }

      this.calendar.addEvent(event)
    }
  }
}
