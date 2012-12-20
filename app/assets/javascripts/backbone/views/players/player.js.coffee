StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Player extends Backbone.View
  tagName: 'tr'

  template: "player_template"
  
  events:
    'click .btn-destroy': 'destroy'
    
  destroy: ->
    @model.destroy()
    @remove()

    return false
  
  render: =>
    @$el.html( template(@template)(@model) )
    
    return this