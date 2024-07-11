import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "preview"]

    connect() {
        this.inputTarget.addEventListener('change', this.showPreview.bind(this))
    }

    showPreview() {
        this.previewTarget.innerHTML = ''
        Array.from(this.inputTarget.files).forEach(file => {
            const reader = new FileReader()
            reader.onload = (e) => {
                const img = document.createElement('img')
                img.src = e.target.result
                img.className = 'w-full h-auto object-cover rounded-lg shadow-md'
                if (!this.previewTarget.querySelector(`img[src="${img.src}"]`)) {
                    this.previewTarget.appendChild(img)
                }
            }
            reader.readAsDataURL(file)
        })
    }
}
