import { Controller } from "@hotwired/stimulus"
import Choices from "choices.js"

// Connects to data-controller="choice-item"
export default class extends Controller {
  static targets = ["selected_item"]

  connect() {
    let choice_item = this.selected_itemTarget
    let choice = new Choices(choice_item, {allowHTML: true})
  }
}
