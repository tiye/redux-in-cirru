
var
  ({}~ createStore compose combineReducers) $ require :redux
  ({}~ devTools persistState) $ require :redux-devtools

var
  todoApp $ require :./reducer

var finalCreateStore $ compose
  devTools
  persistState $ window.location.href.match
    , "/[?&]debug_session=([^&]+)\\b"
  , createStore

var store $ finalCreateStore $ combineReducers $ {}
  :todo todoApp

= module.exports store
