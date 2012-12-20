class StartupSoccerManager.Models.Club extends Backbone.Model
  paramRoot: 'club'
  
  defaults:
    name: null
    founded_at: null
    
  validate: (attrs) ->
    "Name shouldn't be empty" if attrs.name? and attrs.name == ""