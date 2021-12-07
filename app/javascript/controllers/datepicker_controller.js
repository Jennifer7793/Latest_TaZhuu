import {Controller } from "stimulus"
import DP from 'mc-datepicker'

export default class extends Controller {
  static targets = ["picker"]

  initialize() {
    this.picker = null
  }

  connect() {
    this.picker = DP.create({
      el: "#picker"
    })
  }
  show() {
    this.picker.open()
  }
}