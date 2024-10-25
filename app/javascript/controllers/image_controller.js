import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
    static targets = ["mainImage"]

    connect() {
        console.log('Connected')
    }

    change(event) {
        console.log('Changed')
        const newSrc = event.target.src
        this.mainImageTarget.src = newSrc
    }
}
