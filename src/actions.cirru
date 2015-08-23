
var
  store $ require :./store
  shortid $ require :shortid

= exports.add $ \ (text)
  {} (:type :add) $ :data $ {}
    :id (shortid.generate)
    :text text

= exports.remove $ \ (id)
  {} (:type :remove) $ :data id

= exports.update $ \ (id text)
  {} (:type :update) $ :data $ {}
    :id id
    :text text

= exports.toggle $ \ (id)
  {} (:type :toggle) $ :data id
