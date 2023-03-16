// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"




setInterval(() => {
    const pTime = document.querySelector('#sidebar-time')

    const minute = new Date().getMinutes()
    const hour = new Date().getHours()
    pTime.textContent = `${hour}:${minute}`

}, 10000)
