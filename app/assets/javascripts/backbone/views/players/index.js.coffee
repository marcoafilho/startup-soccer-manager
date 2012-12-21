StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Index extends Backbone.View
  className: "players-index"
    
  template: "players_template"
    
  addOne: (player) =>
    @view = new StartupSoccerManager.Views.Players.Player( model: player )
    @$('.table tbody').append( @view.render().el )
  
  render: ->
    @$el.html( template(@template)(@collection.toJSON()) )
    @collection.each(@addOne)
    
    return this