
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

  :onToggle $ \ (id)
    this.props.toggle id

  :renderBody $ \ ()
    this.props.todo.map $ \\ (item)
      var onClick $ \\ ()
        this.onClick item
      var onRemove $ \\ ()
        this.onRemove $ item.get :id
      var onUpdate $ \\ (event)
        this.onUpdate (item.get :id) event.target.value
      var onToggle $ \\ ()
        this.onToggle (item.get :id)

      div ({} (:className ":todo-item line") (:key $ item.get :id))
        input $ {} (:type :checkbox) (:checked $ item.get :done) (:onClick onToggle)
        input $ {} (:value $ item.get :text) (:key $ item.get :id)
          :onChange onUpdate
        div ({} (:className ":button is-danger") (:onClick onRemove)) :Remove

  :render $ \ ()
    div ({} (:className :todo-list))
      div ({} (:className :todo-header))
        div ({} (:className ":todo-add button is-attract") (:onClick this.onAdd)) :Add
      div ({} (:className :todo-body))
        this.renderBody
      div ({} (:className :todo-footer))
