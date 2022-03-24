// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import StimulusReflex from "stimulus_reflex";
import { cable } from "@hotwired/turbo-rails";
// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const consumer = await cable.getConsumer()
StimulusReflex.initialize(application, { consumer, debug: true });
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
