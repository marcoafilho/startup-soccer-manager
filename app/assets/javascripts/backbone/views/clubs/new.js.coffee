StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.New extends Backbone.View
  className: "clubs-new"
  
  template: "new_club_template"
  
  events:
    'submit': 'submit'
    'click .add-player': 'associatePlayer'
    'click img.img-polaroid': 'rebuildLogo'
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    
  loadCalendars: ->
    @$('.datepicker').datepicker( format: "yyyy-mm-dd", viewMode: 'years')
    
  rebuildLogo: (e) ->
    @newLogo()
    
  addPlayer: (player) =>
    teamPlayerView = new StartupSoccerManager.Views.Clubs.EditTeamPlayer( model: player )
    @playerList ||= @$('.team-players')
    @playerList.append(teamPlayerView.render().el)

  associatePlayer: (e) =>
    playerId = parseInt(@$('#club_players :selected').val())
    @$('#club_players :selected').remove()
    if playerId?
      player = new StartupSoccerManager.Models.Player(id: playerId)
      player.fetch(
        success: => 
          player.save(club_id: @model.get("id"))
          @model.objectPlayers.add(player)
          @addPlayer(player)
      )
        
  newLogo: ->
    @currentImageId ||= 1
    @currentImageId = 1 if @currentImageId == 8 + 1 # Images availables plus one to count back

    @$('.club-logo img').attr('src', "assets/clubs/" + @currentImageId++ + ".png")  
    
  submit: (e) ->
    e.preventDefault()

    @model.set 
      name: @$('#club_name').val()
      founded_at: @$('#club_founded_at').val()
      club_image_url: $('.club-logo img').attr('src')

    @collection.create( @model.toJSON(),
      success: (club) =>
        @model = club
        window.location.hash = ''

      error: (club, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
      
  render: ->
    @$el.html( template(@template)(@model) )
    @loadCalendars()
    
    return this