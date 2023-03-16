import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animate-scroll"
export default class extends Controller {
  static targets = ["animatable"]
  static values = {
    animation: {
      type: String,
      default: "animate__slideInUp"
    }
  }
  
  connect() {
    this.prepareTargets()
    this.setupObserver()
  }

  prepareTargets() {
    this.animatableTargets.forEach(target => {
      target.classList.add('animate__animated', 'opacity-0')
    })
  }

  setupObserver() {
    this.observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.remove("opacity-0")
          entry.target.classList.add(this.animationValue)

          this.observer.unobserve(entry.target)
        }
      })
    }, { threshold: 0.5 })

    this.animatableTargets.forEach(target => this.observer.observe(target))
  }
}

