StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Team extends Backbone.View
  template: 'club_team_template'
  
  initialize: (options) ->
    @collection = new StartupSoccerManager.Collections.Players()
    @collection.reset options.collection
    
  displayPlayer: (player, index) =>
    @teamPlayerView = new StartupSoccerManager.Views.Clubs.TeamPlayer(model: player)
    if index < 6
      @$('.first-team .players').append(@teamPlayerView.render().el)
    else if index < 12
      @$('.reserve-team .players').append(@teamPlayerView.render().el)
    
  render: ->
    @$el.html( template(@template)(@collection) )
    @collection.each(@displayPlayer)
    
    return this