StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.New extends Backbone.View
  className: 'clubs-new'
  
  template: "new_club_template"
  
  events:
    'submit': 'submit'
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()
      
  render: ->
    @$el.html( template(@template)(@model.toJSON() ) )
    
    return this
    
  submit: (e) ->
    e.preventDefault()
    
    @model.set 
      name: $('#club_name').val()
      founded_at: $('#club_founded_at').val()
      
    @collection.create( @model.toJSON(),
      success: (club) =>
        @model = club
        window.location.hash = ''
      
      error: (club, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    