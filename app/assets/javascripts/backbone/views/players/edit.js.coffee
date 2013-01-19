StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Edit extends Backbone.View
  className: "players-edit"
    
  template: "edit_player_template"
  
  events: 
    'submit': 'submit'
    'change input[type="text"]': 'rebuildPlayerCard'
    'change input[type="number"]': 'rebuildPlayerCard'
    'click img.img-polaroid': 'rebuildPlayerCardAndImage'
    'click input[type="radio"][name="player[gender]"]': 'rebuildPlayerCardAndImage'
    'click input[type="radio"]': 'rebuildPlayerCard'
    'change select': 'rebuildPlayerCard'
    'blur .datepicker': 'rebuildPlayerCard'
    
  buildModel: ->
    @model.set 
      last_name:    @$('#player_last_name').val()
      first_name:   @$('#player_first_name').val()
      born_at:      @$('#player_born_at').val()
      number:       @$('#player_number').val()
      position:     @$('#player_position :selected').val()
      gender:       @$('input[name="player[gender]"]:checked').val()
      acceleration: @$('#player_acceleration').val()
      aggression:   @$('#player_aggression').val()
      balance:      @$('#player_balance').val()
      marking:      @$('#player_marking').val()
      stamina:      @$('#player_stamina').val()
      profile_image_url: @modelObserver.get('profile_image_url')
      
  updateModelObserver: ->
    @modelObserver.set 
      last_name:    @$('#player_last_name').val()
      first_name:   @$('#player_first_name').val()
      born_at:      @$('#player_born_at').val()
      number:       @$('#player_number').val()
      position:     @$('#player_position :selected').val()
      gender:       @$('input[name="player[gender]"]:checked').val()
      acceleration: @$('#player_acceleration').val()
      aggression:   @$('#player_aggression').val()
      balance:      @$('#player_balance').val()
      marking:      @$('#player_marking').val()
      stamina:      @$('#player_stamina').val()
    
  buildPlayerCard: ->
    @modelObserver ||= new StartupSoccerManager.Models.Player(@model.toJSON())
    @playerCard ||= new StartupSoccerManager.Views.Players.Show( model: @modelObserver )
    @playerCard.model = @modelObserver
    @$('.player-previewer table').stickyScroll( mode: 'manual', topBoundary: 190 )
    @$('.player-previewer tbody').html(@playerCard.render().$el)
    @playerCard.$('img.img-polaroid').addClass('clickable')
    @playerCard.$el.show()
    
  rebuildPlayerCard: ->
    @updateModelObserver()
    @buildPlayerCard()
    
  rebuildPlayerCardAndImage: ->
    @updateModelObserver()
    @newProfileImage() # TODO: This should be handled at the show view.
    @buildPlayerCard()
    
  newProfileImage: ->
    @currentImageId ||= 1
    @currentImageId = 1 if @currentImageId == 11 + 1 # Images availables plus one to count back
    
    @modelObserver.set(profile_image_url: "assets/players/" + @modelObserver.displayGender() + "/" + @currentImageId++ + ".png")
    
  loadCalendars: ->
    @$('.datepicker').datepicker( format: "yyyy-mm-dd", viewMode: 'years')
    
  selectPlayerPosition: ->
    _.each(@$('#player_position option'), (option) =>
      if @model.get('position') == $(option).val()
        $(option).attr('selected', 'selected')
    )

  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    @loadCalendars()
    @selectPlayerPosition()
    @buildPlayerCard()
    
    return this
    
  submit: (e) ->
    e.preventDefault()

    @buildModel()
      
    @model.save( @model.toJSON(),
      success: (club) =>
        @model = club
        window.location.hash = ''
      
      error: (club, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
