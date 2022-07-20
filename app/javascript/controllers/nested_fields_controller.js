import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-fields"
export default class extends Controller {
  static targets = ["template", "add_item"]

  initialize() {
  }

  connect() {
  }

  add_record() {
    //console.log('test')
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)    
  }

  remove_record() {
    event.preventDefault()
    let item = event.target.closest('.nested-fields')
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}
