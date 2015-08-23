
var
  React $ require :react
  ({}~ connect) $ require :react-redux

var
  div $ React.createFactory :div

var todoComponent $ React.createClass $ {}
  :displayName :app-todo

  :render $ \ ()
    console.log this.props

    div null :todo

var select $ \ (state)
  {}
    :todo state.todo

= module.exports $ (connect select) todoComponent