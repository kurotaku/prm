// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

$(document).on('click', '.maker-info', function(){
  $('#makerMenu').toggle();
  $('#makerMenuBg').toggle();
});

$(document).on('click', '#makerMenuBg', function(){
  $('#makerMenu').toggle();
  $('#makerMenuBg').toggle();
});

$(document).on('click', '#userIcon', function(){
  $('#userMenu').toggle();
  $('#userMenuBg').toggle();
});

$(document).on('click', '#userMenuBg', function(){
  $('#userMenu').toggle();
  $('#userMenuBg').toggle();
});

$(document).on('click', '#commentOpen', function(){
  $('#rightCol').addClass('on');
});

$(document).on('click', '#rightColClose', function(){
  $('#rightCol').removeClass('on');
});
