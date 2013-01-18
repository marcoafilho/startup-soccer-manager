StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Edit extends Backbone.View
  className: 'clubs-edit'
  
  template: "edit_club_template"
  
  events:
    'submit': 'submit'
    'click .add-player': 'associatePlayer'
    
  loadCalendars: ->
    @$('.datepicker').datepicker( format: "yyyy-mm-dd", viewMode: 'years')
    
  loadClubPlayers: ->
    @model.objectPlayers.each(@addPlayer)
    
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
      
  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    @loadClubPlayers()
    @loadCalendars()
    
    return this