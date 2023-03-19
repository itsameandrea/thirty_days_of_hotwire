import { Controller } from "@hotwired/stimulus"
import Uppy from '@uppy/core'
import DragDrop from '@uppy/drag-drop'
import ProgressBar from '@uppy/progress-bar'
import ActiveStorageUpload from '@excid3/uppy-activestorage-upload'

// Connects to data-controller="uppy"
export default class extends Controller {
  static targets = ["dropzone", "progressBar", "uploadedFiles", "preview", "input"]
  static values = { directUploadUrl: String }

  connect() {
    this.setupUppy()
  }

  setupUppy() {
    this.uppyInstance = new Uppy({ debug: true, autoProceed: true })

    this.uppyInstance
      .use(DragDrop, { target: this.dropzoneTarget })
      .use(ActiveStorageUpload, { directUploadUrl: this.directUploadUrlValue })
      .use(ProgressBar, { target: this.progressBarTarget, hideAfterFinish: false })
      .on('upload-success', this.onUploadSuccess.bind(this))
  }

  onUploadSuccess(file, response) {
    const url = response.uploadURL
    const fileName = file.name

    const preview = this.previewTarget.content.cloneNode(true)
    const input = this.inputTarget.content.cloneNode(true)

    const img = preview.querySelector('img')
    img.src = `/rails/active_storage/blobs/redirect/${response.signed_id}/${response.filename}`

    const field = input.querySelector('input')
    field.value = response.signed_id

    this.uploadedFilesTarget.appendChild(preview)
    this.uploadedFilesTarget.appendChild(input)
  }
}



