StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Edit extends Backbone.View
  className: 'clubs-edit'
  
  template: "edit_club_template"
  
  events:
    'submit': 'submit'
      
  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this
    
  submit: (e) ->
    e.preventDefault()
    
    @model.set 
      name: $('#club_name').val()
      founded_at: $('#club_founded_at').val()
      
    @model.save( @model.toJSON(),
      success: (club) =>
        @model = club
        window.location.hash = ''
      
      error: (club, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )