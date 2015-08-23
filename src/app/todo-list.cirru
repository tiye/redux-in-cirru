
var
  React $ require :react

var
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :todo-list

  :onClick $ \ (item)
    this.props.toggle $ item.get :id

  :onAdd $ \ ()
    this.props.add :

  :onRemove $ \ (id)
    this.props.remove id

  :onUpdate $ \ (id text)
    this.props.update id text

  :renderBody $ \ ()
    this.props.todo.map $ \\ (item)
      var onClick $ \\ ()
        this.onClick item
      var onRemove $ \\ ()
        this.onRemove $ item.get :id
      var onUpdate $ \\ (event)
        this.onUpdate (item.get :id) event.target.value

      div ({} (:className :todo-item) (:key $ item.get :id))
        input $ {} (:type :checkbox) (:value $ item.get :done)
        input $ {} (:value $ item.get :text) (:key $ item.get :id)
          :onChange onUpdate
        div ({} (:onClick onClick)) :Toggle
        div ({} (:onClick onRemove)) :Remove

  :render $ \ ()
    div ({} (:className :todo-list))
      div ({} (:className :todo-header))
        div ({} (:className :todo-add) (:onClick this.onAdd)) :Add
      div ({} (:className :todo-body))
        this.renderBody
      div ({} (:className :todo-footer))
