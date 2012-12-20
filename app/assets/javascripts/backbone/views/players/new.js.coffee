StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.New extends Backbone.View
  className: "players-new"
    
  template: "new_player_template"
  
  events:
    'submit': 'submit'
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()
  
  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this
  
  submit: (e) ->
    e.preventDefault()
    
    @model.set
      last_name: @$('#player_last_name').val()
      first_name: @$('#player_first_name').val()
      born_at: @$('#player_born_at').val()
      number: @$('#player_number').val()
      position: @$('#player_position:selected').val()
      gender: @$('[idˆ="player_gender"]:checked').val()
      acceleration: @$('#player_acceleration').val()
      aggression: @$('#player_aggression').val()
      balance: @$('#player_balance').val()
      marking: @$('#player_marking').val()
      stamina: @$('#player_stamina').val()
      
    @collection.create(@model)