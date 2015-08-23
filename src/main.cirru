
var
  React $ require :react

require :origami-ui

var
  Page $ React.createFactory $ require :./app/page

React.render (Page) document.body