import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="additional-cost"
export default class extends Controller {
  static targets = [ "additionalCost", "produit", "emballage"]

  editAdditionalCost1() {
    if (this.produitTarget.checked) {
      this.additionalCostTarget.value = parseInt(this.additionalCostTarget.value) + 10
    } else {
      this.additionalCostTarget.value = parseInt(this.additionalCostTarget.value) - 10
    }
  }

  editAdditionalCost2() {
    if (this.emballageTarget.checked) {
      this.additionalCostTarget.value = parseInt(this.additionalCostTarget.value) + 5
    } else {
      this.additionalCostTarget.value = parseInt(this.additionalCostTarget.value) - 5
    }
  }
}
