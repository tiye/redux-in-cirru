
var
  Immutable $ require :immutable

var initialTodoState (Immutable.List)

var todoApp $ \ (state action)
  = state $ or state initialTodoState
  case action.type
    :add
      var newId action.data.id
      var newText action.data.text
      state.push $ Immutable.fromJS $ {}
        :id newId
        :done false
        :text newText
    :remove
      var removeId action.data
      state.filterNot $ \ (item)
        is (item.get :id) removeId
    :toggle
      var toggleId action.data
      state.map $ \ (item)
        cond (is (item.get :id) toggleId)
          item.update :done $ \ (mode) (not mode)
          , item
    :update
      var updateId action.data.id
      var newText action.data.text
      state.map $ \ (item)
        cond (is (item.get :id) updateId)
          item.set :text newText
          , item
    else state

= module.exports todoApp
