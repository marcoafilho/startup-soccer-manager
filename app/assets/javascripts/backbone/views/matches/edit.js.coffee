StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.Edit extends Backbone.View
  className: "matches-edit"
    
  template: "edit_match_template"
  
  events:
    "submit": "submit"
            
  submit: (e) ->
    e.preventDefault()
    
    @model.set
      guest_score: @$('#match_guest_score').val()
      host_score: @$('#match_host_score').val()
            
    @model.save(@model.toJSON(),
      success: window.location = '/matches'
    )

  render: ->
    @$el.html( template(@template)(@model) )
    
    return this