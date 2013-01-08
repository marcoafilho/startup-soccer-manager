class StartupSoccerManager.Routers.MatchesRouter extends Backbone.Router
  initialize: (options) ->
    @matches = new StartupSoccerManager.Collections.Matches()
    @matches.reset(options.matches)
    
  routes:
    "index": "index"
    "new": "newMatch"
    ":id/edit": "edit"
    ".*": "index"
    
  index: ->
    @view = new StartupSoccerManager.Views.Matches.Index( collection: @matches )
    @display()
    
  newMatch: -> 
    @view = new StartupSoccerManager.Views.Matches.New( collection: @matches )
    @display()
    
  edit: (id) ->
    match = @matches.get(id)
    
    @view = new StartupSoccerManager.Views.Matches.Edit( model: match )
    @display()
    
  display: ->
    $('#matches').html( @view.render().el )