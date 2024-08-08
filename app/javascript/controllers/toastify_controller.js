import { Controller } from "@hotwired/stimulus"
import Toastify from 'toastify-js'

export default class extends Controller {
  static targets = ["notice", "alert"]

  showToast(message, type) {
    Toastify({
      text: message,
      duration: 3000,
      gravity: "top",
      position: "right",
      backgroundColor: type === "success" ? "#4CAF50" : "#F44336",
      callback: this._resetToast.bind(this)
    }).showToast();
  }

  _resetToast() {
    if (this.hasNoticeTarget) {
      this.noticeTarget.remove()
    }

    if (this.hasAlertTarget) {
      this.alertTarget.remove()
    }
  }

  noticeTargetConnected() {
    this.showToast(this.noticeTarget.textContent, "success")
  }

  alertTargetConnected() {
    this.showToast(this.alertTarget.textContent, "error")
  }
}
