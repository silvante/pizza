import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="count"
export default class extends Controller {
  static targets = ["output", "input"]
  static values = { count: Number }

  connect() {
    this.countValue = 1; // Default quantity
    this.updateFormInput();
  }

  increment() {
    this.countValue++;
    this.updateUI();
  }

  decrement() {
    if (this.countValue > 1) {
      this.countValue--;
      this.updateUI();
    }
  }

  updateUI() {
    this.outputTarget.textContent = this.countValue;
    this.updateFormInput();
  }

  updateFormInput() {
    this.inputTarget.value = this.countValue;
  }
}
