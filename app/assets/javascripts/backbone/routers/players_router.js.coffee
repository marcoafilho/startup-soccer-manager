class StartupSoccerManager.Routers.PlayersRouter extends Backbone.Router
  initialize: (options) ->
    @players = new StartupSoccerManager.Collections.Players()
    @players.reset options.players
  
  routes:
    "index"   : "index"
    "new"     : "newPlayer"
    ":id/edit": "edit"
    ".*"      : "index"
    
  index: ->
    @view = new StartupSoccerManager.Views.Players.Index( collection: @players )
    @display()
    
  newPlayer: ->
    @view = new StartupSoccerManager.Views.Players.New( collection: @players )
    @display()
    
  edit: (id) ->
    player = @players.get(id)
    
    @view = new StartupSoccerManager.Views.Players.Edit( model: player )
    @display()
    
  display: ->
    $('#players').html( @view.render().el )