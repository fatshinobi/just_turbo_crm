import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="people-of-customer"
export default class extends Controller {
  static targets = ["person_list"]

  connect() {
  }

  set_people() {
    event.preventDefault()

    const company_id = event.currentTarget.value

    this.person_listTarget.innerHTML = ""

    const url = `people/by_company/${company_id}.js`

    fetch(url)
      .then(response => response.json())
      .then(data => {
        data.forEach((rec) => {
          this.add_person(rec.id, rec.name)
        })
      })
  
  }

  add_person(id, caption) {
    let option = document.createElement("option")
    option.value = id
    option.innerHTML = caption
    this.person_listTarget.appendChild(option)
  }
}
