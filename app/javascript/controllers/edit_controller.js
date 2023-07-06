import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ["div1", "div2", "div3", "div4"]

  showDiv1() {
    this.div2Target.classList.remove("d-none");
    this.div2Target.classList.add("d-block");
    this.div1Target.classList.add("d-none");
  }

  showDiv2() {
    this.div3Target.classList.remove("d-none")
    this.div3Target.classList.add("d-block")
    this.div2Target.classList.add("d-none")
  }

  showDiv3() {
    this.div4Target.classList.remove("d-none")
    this.div4Target.classList.add("d-block")
    this.div2Target.classList.add("d-none")
    this.div3Target.classList.add("d-none")
  }
}
