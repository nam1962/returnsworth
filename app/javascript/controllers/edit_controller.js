import { Controller } from "@hotwired/stimulus"

let nbElements = 1
// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ["div1", "nbElements", "divFin"]

  showDiv1() {
    this.div1Target.classList.add("d-none");
    document.getElementById(`item0`).classList.remove("d-none");
  }

  showDiv2() {
    if (nbElements < parseInt(this.nbElementsTarget.innerHTML)) {
      if (nbElements == 0) {

      } else {
        document.getElementById(`item${nbElements - 1}`).classList.add("d-none")
      }
      document.getElementById(`item${nbElements}`).classList.remove("d-none")
    } else {
      document.getElementById(`item${nbElements - 1}`).classList.add("d-none")
      this.divFinTarget.classList.remove("d-none");
    }
    nbElements += 1
  }
}
