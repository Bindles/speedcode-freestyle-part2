// app/javascript/controllers/infinite_scroll_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["end"];

  connect() {
    this.observe();
  }

  observe() {
    if (!this.endTarget) return;

    const observer = new IntersectionObserver((entries) => {
      if (entries[0].isIntersecting) {
        this.loadMore();
      }
    });

    observer.observe(this.endTarget);
  }

  loadMore() {
    const nextPageLink = document.querySelector(".ProductGrid_more");

    if (nextPageLink) {
      nextPageLink.click();
    }
  }
}
