// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Sortable from 'sortablejs';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

$(document).on('click', '.tricolon-icon', function(){
  console.log('fire');
  $('.tricolon-menu').css('z-index', '');
  $(this).parents('.tricolon-menu').css('z-index', '10');
  $(this).siblings('.tricolon-menu-list').toggleClass('hide');
  $(this).siblings('.tricolon-menu-bg').toggleClass('hide');
});

$(document).on('click', '.tricolon-menu-bg', function(){
  $(this).toggleClass('hide');
  $(this).siblings('.tricolon-menu-list').toggleClass('hide');
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

// sortable
$(document).on('turbolinks:load', function() {
  var el = $('#sortableList');
  if(el.length){
    var sortable = Sortable.create(el[0], {
      handle: ".order-handler",
      onEnd: function (event) {
        var itemIDList = el.children().map(function(index){
          $(this).find( ".position" ).text(index + 1)
          return "item[]=" + $(this).data("id");
        }).get().join("&");

        Rails.ajax({
          url: el.data("url"),
          type: "PATCH",
          data: itemIDList
        })
      }
    });
  }
})

// table link
$(document).on('click', '[data-menu-item-path]', function(e){
  if(e.ctrlKey || e.metaKey) {
    window.open($(this).data('menu-item-path'));
  } else if (e.shiftKey) {
    window.open($(this).data('menu-item-path'), "_blank");
    return;
  } else {
    window.location = $(this).data('menu-item-path')
  }
});
