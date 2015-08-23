
var
  React $ require :react
  actions $ require :../actions
  ({}~ connect) $ require :react-redux
  ({}~ bindActionCreators) $ require :redux

var
  TodoList $ React.createFactory $ require :./todo-list

var
  div $ React.createFactory :div

var todoComponent $ React.createClass $ {}
  :displayName :app-todo

  :render $ \ ()
    TodoList $ React.__spread
      {} (:todo this.props.todo)
      bindActionCreators actions this.props.dispatch

var select $ \ (state)
  {}
    :todo state.todo

= module.exports $ (connect select) todoComponent
