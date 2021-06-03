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

$(function(){
  console.log('fire');
});

$(document).on('click', '.vendor-info', function(){
  $('#vendorMenu').toggle();
  $('#vendorMenuBg').toggle();
});

$(document).on('click', '#vendorMenuBg', function(){
  $('#vendorMenu').toggle();
  $('#vendorMenuBg').toggle();
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

// Flash Message
$(document).on('click', '.flash-close', function(){
  console.log($(this).parents().find('.flash-message'));
  $(this).parents().find('.flash-message').hide();
});

$(document).on('change', '.autoSubmit', function(){
  $('.autoSubmitButton').click();
});
