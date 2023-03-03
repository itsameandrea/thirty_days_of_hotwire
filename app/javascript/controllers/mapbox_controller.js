import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  initialize() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.map.addControl(new mapboxgl.NavigationControl())

    this.#addMarkers()
    this.#centerMap()
  }

  #addMarkers() {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #centerMap() {
    if (this.markersValue.length === 0) return

    const bounds = new mapboxgl.LngLatBounds()

    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat])
    })

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
