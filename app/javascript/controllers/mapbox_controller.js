import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
  }

  static targets = ["map", "markers"]

  initialize() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.map.addControl(new mapboxgl.NavigationControl())
    this.render()
  }

  render() {
    this.#addMarkers()
    this.#centerMap()
  }

  get coordinates() {
    return JSON.parse(this.markersTarget.dataset.coordinates) || []
  }

  #addMarkers() {
    this.coordinates.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #centerMap() {
    if (this.coordinates.length === 0) return

    const bounds = new mapboxgl.LngLatBounds()

    this.coordinates.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat])
    })

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
