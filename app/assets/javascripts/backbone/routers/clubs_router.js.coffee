class StartupSoccerManager.Routers.ClubsRouter extends Backbone.Router
  initialize: (options) ->
    @clubs = new StartupSoccerManager.Collections.Clubs()
    @clubs.reset options.clubs
  
  routes:
    "index"   : "index"
    "new"     : "newClub"
    ":id"     : "show"
    ":id/edit": "edit"
    ".*"      : "index"
    
  index: ->
    @view = new StartupSoccerManager.Views.Clubs.Index( collection: @clubs )
    $('#clubs').html(@view.render().el)
    
  newClub: ->
    @view = new StartupSoccerManager.Views.Clubs.New( collection: @clubs )
    $('#clubs').html(@view.render().el)
  
  edit: (id) ->
    club = @clubs.get(id)
    
    @view = new StartupSoccerManager.Views.Clubs.Edit( model: club )
    $('#clubs').html(@view.render().el)