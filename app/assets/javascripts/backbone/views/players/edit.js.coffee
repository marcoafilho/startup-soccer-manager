StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Edit extends Backbone.View
  className: "players-edit"
    
  template: "edit_player_template"
  
  events: 
    'submit': 'submit'

  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this
    
  submit: (e) ->
    e.preventDefault()
    