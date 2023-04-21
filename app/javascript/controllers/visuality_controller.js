import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['element', "nameTextInput"]

  connect() {
    console.log('visuality_controller', this.nameTextInputTarget)
    // console.log(this.elementTarget)
    this.initMap()
  }

  onInput(e) {
    console.log('did something', e.target.value)
  }

  initMap() {
    setTimeout(() => {

      mapboxsearch.autofill({
        accessToken: "pk.eyJ1IjoiYWRyaWFudGhlZGV2IiwiYSI6ImNsZnRqbHN2NDAxazQzZnBpaWc5amVjdGkifQ.xS3RDkVMz-hyynuMnwOLUQ"
      });
    }, 300);
  }
}
