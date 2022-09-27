import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["drop", "output", "full"]
  toggle() {
    if (this.outputTarget.hidden == true) {
      this.outputTarget.hidden = false
      this.fullTarget.hidden = false
    } else if (this.outputTarget.hidden == false) {
      this.outputTarget.hidden = true
      this.fullTarget.hidden = true
    }
  }

  overlay() {
    if (this.fullTarget.hidden == true) {
      this.fullTarget.hidden = false
    } else if (this.fullTarget.hidden == false) {
      this.fullTarget.hidden = true
      this.outputTarget.hidden = true
    }
  }
}