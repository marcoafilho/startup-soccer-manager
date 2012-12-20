class StartupSoccerManager.Routers.ClubsRouter extends Backbone.Router
  initialize: (options) ->
    @clubs = new StartupSoccerManager.Collections.Clubs()
    @clubs.reset options.clubs
  
  routes:
    "index"   : "index"
    ".*"      : "index"
    ":id"     : "show"
    "new"     : "newClub"
    ":id/edit": "edit"
    
  index: ->
    @view = new StartupSoccerManager.Views.Clubs.Index( collection: @clubs )
    $('#clubs').html(@view.render().el)