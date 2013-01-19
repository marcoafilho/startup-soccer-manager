StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.New extends Backbone.View
  className: "matches-new"
    
  template: "new_match_template"
  
  events:
    'submit': 'submit'
    
  initialize: (collection) ->
    super(collection)
    @model = new @collection.model()
    
  loadCalendars: ->
    @$('.datepicker').datepicker( format: "yyyy-mm-dd", viewMode: 'years')
        
  submit: (e) ->
    e.preventDefault()
    
    @model.set
      host_id: @$('#match_host_id :selected').val()
      guest_id: @$('#match_guest_id :selected').val()
      location: @$('#match_location').val()
      played_at: @$('#match_played_at').val()  
    
    @collection.create(@model.toJSON(),
      success: window.location.hash = '/matches'
    )
      
  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    @loadCalendars()
    
    this