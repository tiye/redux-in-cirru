
var
  fs $ require :fs
  path $ require :path
  webpack $ require :webpack

= module.exports $ object
  :entry $ object
    :vendor $ array :react :redux :immutable :react-redux :shortid
      , :redux-devtools
      , :webpack-dev-server/client?http://0.0.0.0:8080
      , :webpack/hot/dev-server
    :main $ array :./src/main

  :output $ object
    :path :build/
    :filename :[name].js
    :publicPath :http://localhost:8080/build/

  :resolve $ object
    :extensions $ array :.js :.cirru :

  :module $ object
    :loaders $ array
      object (:test /\.cirru$) (:loader :react-hot!cirru-script) (:ignore /node_modules)
        :include $ path.join __dirname :src
      object (:test /\.css$) (:loader :style!css)

  :plugins $ array
    new webpack.optimize.CommonsChunkPlugin :vendor :vendor.js
