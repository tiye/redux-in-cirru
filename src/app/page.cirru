
var
  React $ require :react
  ({}~ DevTools DebugPanel LogMonitor) $ require :redux-devtools/lib/react
  ({}~ Provider connect) $ require :react-redux

var
  store $ require :../store

var
  div $ React.createFactory :div
  Todo $ React.createFactory $ require :./todo
  ProviderFac $ React.createFactory Provider
  DebugPanelFac $ React.createFactory DebugPanel

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :render $ \ ()
    div ({} (:className :app-page))
      ProviderFac ({} (:store store)) $ \ ()
        Todo
      DebugPanelFac ({} (:top true) (:right true) (:bottom true))
        React.createElement DevTools $ {}
          :store store
          :monitor LogMonitor
