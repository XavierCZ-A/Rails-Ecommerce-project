import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
    static targets = ["flash"]

    connect() {
        this.hideAfterDelay()
    }

    close() {
        this.flashTarget.classList.add("opacity-0")
        setTimeout(() => {
            this.element.remove()
        }, 500) // Coincide con la duración de la transición en CSS
    }

    hideAfterDelay() {
        setTimeout(() => {
            this.close()
        }, 3000) // 5 segundos
    }
}
