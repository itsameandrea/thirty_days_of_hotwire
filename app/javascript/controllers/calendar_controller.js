import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'


// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["calendar"]
  
  connect() {
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
  }
}
