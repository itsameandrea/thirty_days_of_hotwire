import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-confirm"
export default class extends Controller {
  static targets = ["dialog", "title", "body", "confirmButton", "cancelButton"]
  static values = {
    title: {
      type: String,
      default: "Are you sure?"
    },
    body: {
      type: String,
      default: "This action can't be undone"
    },
    confirmButtonText: {
      type: String,
      default: "Yes, I'm sure"
    },
    cancelButtonText: {
      type: String,
      default: "Cancel"
    }
  }

  connect() {
    this.setupDialog()
  }

  setupDialog() {
    Turbo.setConfirmMethod((_, element) => {    
      let {
        confirmTitle: titleText,
        confirmBody: bodyText,
        confirmBtnText,
        cancelBtnText
      } = element.dataset
    
      this.titleTarget.innerText = titleText || this.titleValue
      this.bodyTarget.innerText = bodyText || this.bodyValue
      this.confirmButtonTarget.innerText = confirmBtnText || this.confirmButtonTextValue
      this.cancelButtonTarget.innerText = cancelBtnText || this.cancelButtonTextValue
    
      this.dialogTarget.classList.remove('hidden')
    
      this.dialogTarget.showModal()
    
      return new Promise((resolve, reject) => {
        this.dialogTarget.addEventListener("close", () => {
          this.dialogTarget.classList.add('hidden')
          resolve(this.dialogTarget.returnValue === "confirm")
        }, { once: true })
      })
    })
  }
}

