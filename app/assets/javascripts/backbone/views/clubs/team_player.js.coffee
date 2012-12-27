StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.TeamPlayer extends Backbone.View
  template: 'club_team_player_template'
  
  events:
    'click': 'highlightPlayer'
    
  highlightPlayer: ->
    vent.trigger('player_skills:show', @model, @$el)
    vent.trigger('player_position:show', @model)
  
  render: ->
    @$el.html( template(@template)(@model) )
    
    return this