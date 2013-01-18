StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.EditTeamPlayer extends Backbone.View
  className: 'player row'
  
  template: 'club_edit_team_player_template'
  
  events:
    'click .btn-dissociate': 'destroy'
    'click .btn-edit': 'edit'
    
  destroy: ->
    @model.save( club_id: null )
    @remove()
    
  edit: ->
    window.location = '/players#' + @model.get('id') + '/edit'
  
  render: ->
    @$el.html( template(@template)(@model) )
    
    return this