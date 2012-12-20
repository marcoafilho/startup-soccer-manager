StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Player extends Backbone.View
  tagName: 'tr'

  template: "player_template"
  
  render: ->
    @$el.html( template(@template)(@model) )
    
    return this