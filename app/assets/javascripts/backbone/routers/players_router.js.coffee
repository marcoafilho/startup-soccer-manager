class StartupSoccerManager.Routers.PlayersRouter extends Backbone.Router
  initialize: (options) ->
    @players = new StartupSoccerManager.Collections.Players()
    @players.reset options.players
  
  routes:
    "new"     : "newPlayer"
    ":id/edit": "edit"
    
  newPlayer: ->
    @view = new StartupSoccerManager.Views.Players.New( collection: @players )
    $('#players').html( @view.render().el )
    
  edit: (id) ->
    player = @players.get(id)
    
    @view = new StartupSoccerManager.Views.Players.Edit( model: player )
    $('#players').html( @view.render().el )
    