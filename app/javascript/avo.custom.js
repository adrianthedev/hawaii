// eslint-disable-next-line no-console

import VisualityController from "./controllers/visuality_controller"
import "mapkick/bundle"

const application = window.Stimulus

application.register('visuality', VisualityController)

console.log('Hi from Avo custom JS 👋')

