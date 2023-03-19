// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"
import "./controllers"

Turbo.setConfirmMethod((message, element) => {
  const dialog = document.getElementById("turbo_confirm")

  let {confirmTitle: titleText, confirmBody: bodyText, confirmBtnText, cancelBtnText, hideConfirm} = element.dataset

  titleText = titleText || dialog.dataset.titleText
  bodyText = bodyText || dialog.dataset.bodyText
  confirmBtnText = confirmBtnText || dialog.dataset.confirmText
  cancelBtnText = cancelBtnText || dialog.dataset.cancelText

  dialog.querySelector('[data-title]').innerText = titleText
  dialog.querySelector('[data-body]').innerHTML = bodyText
  dialog.querySelector('[data-confirm]').innerText = confirmBtnText
  dialog.querySelector('[data-cancel]').innerText = cancelBtnText

  if (hideConfirm) {
    dialog.querySelector('[data-confirm]').classList.add('hidden')
  }

  dialog.showModal()

  return new Promise((resolve, reject) => {
    dialog.addEventListener("close", () => {
      resolve(dialog.returnValue === "confirm")
    }, { once: true })
  })
})
