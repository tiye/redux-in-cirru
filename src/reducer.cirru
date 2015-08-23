
var
  Immutable $ require :immutable

var initialTodoState (Immutable.List)

var todoApp $ \ (state action)
  = state $ or state initialTodoState
  case action.type
    :add
      var newText action.data
      state.push $ Immutable.fromJS $ {}
        :id (shortid.generate)
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
    else state

= module.exports todoApp
