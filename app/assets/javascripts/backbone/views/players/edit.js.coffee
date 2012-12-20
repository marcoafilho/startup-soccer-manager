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
    
    @model.set 
      last_name:    @$('#player_last_name').val()
      first_name:   @$('#player_first_name').val()
      born_at:      @$('#player_born_at').val()
      number:       @$('#player_number').val()
      position:     @$('#player_position :selected').val()
      gender:       @$('[idˆ="player_gender"] :checked').val()
      acceleration: @$('#player_acceleration').val()
      aggression:   @$('#player_aggression').val()
      balance:      @$('#player_balance').val()
      marking:      @$('#player_marking').val()
      stamina:      @$('#player_stamina').val()
      
    @model.save( @model.toJSON(),
      success: (club) =>
        @model = club
        window.location.hash = ''
      
      error: (club, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
