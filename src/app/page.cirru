
var
  React $ require :react
  Immutable $ require :immutable
  ({}~ DevTools DebugPanel LogMonitor) $ require :redux-devtools/lib/react
  ({}~ Provider connect) $ require :react-redux

var
  store $ require :../store

var
  div $ React.createFactory :div
  Todo $ React.createFactory $ require :./todo
  ProviderFac $ React.createFactory Provider
  DebugPanelFac $ React.createFactory DebugPanel

var show $ \ (data)
  var wrapped $ Immutable.fromJS $ or data ({})
  return (wrapped.toJS)

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
          :select show
