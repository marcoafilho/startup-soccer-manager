#= require_self
#= require_tree ./models/
#= require_tree ./collections/
#= require_tree ./views/
#= require_tree ./routers/
#= require_tree .

window.StartupSoccerManager =
  Models:      {}
  Collections: {}
  Views:       {}
  Routers:     {}
  
window.template = (name) -> 
  _.template($('#' + name).html())
  
window.vent = _.extend({}, Backbone.Events)