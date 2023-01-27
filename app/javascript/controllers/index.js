// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import ChatRefreshController from "./chat_refresh_controller"
application.register("chat_refresh", ChatRefreshController)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
