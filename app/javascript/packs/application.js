// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require.context('../images', true)

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery"
// import "popper.js"
import "bootstrap"
import "@nathanvda/cocoon"
import "moment"
import 'datatables.net-bs4'

import $ from 'jquery';
global.$ = jQuery;

// import $ from 'jquery'
// require('imports-loader?define=>false!datatables.net')(window, $)
// require('imports-loader?define=>false!datatables.net-select')(window, $)
// import 'datatables.net-dt/css/jquery.dataTables.css'
// import 'datatables.net-select-dt/css/select.dataTables.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../src/response'
import '../src/shared'
import '../src/survey'
import '../src/users'

require("trix")
require("@rails/actiontext")