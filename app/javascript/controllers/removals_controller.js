import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  connect() {
    var that = this
    setTimeout( () => {
      that.element.remove()
    }, 1000)
  }

  remove() {
  }

}
