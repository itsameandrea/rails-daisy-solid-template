import { Controller } from "@hotwired/stimulus"
import * as FilePond from "filepond"
import { DirectUpload } from "@rails/activestorage"

export default class extends Controller {
  connect() {
    const uploadUrl = document.querySelector('meta[name="direct-upload-url"]').content
    const form = this.element.closest("form")
    const element = this.element


    this.pond = FilePond.create(this.element, {
      server: {
        process: (fieldName, file, metadata, load, error, progress, abort, transfer, options) => {
          const uploader = new DirectUpload(file, uploadUrl, {
            directUploadWillStoreFileWithXHR: (request) => {
              request.upload.addEventListener("progress", (event) => {
                progress(event.lengthComputable, event.loaded, event.total)
              })
            }
          })

          uploader.create((errorResponse, blob) => {
            if (errorResponse) {
              error(`Upload error: ${errorResponse}`)
            } else {
              const hiddenField = document.createElement("input")
              hiddenField.setAttribute("type", "hidden")
              hiddenField.setAttribute("value", blob.signed_id)
              hiddenField.name = element.getAttribute("name")

              form.appendChild(hiddenField)
              load(blob.signed_id)
            }
          })

          return {
            abort: () => {
              uploader.abort()
              abort()
            }
          }
        },
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      }
    })
  }
}
