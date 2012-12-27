StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Show extends Backbone.View
  tagName: "tr"
  
  template: "show_club_template"
  
  initialize: ->
    @players = new StartupSoccerManager.Collections.Players()
    @players.reset @model.get("players")
    
    vent.on('player_skills:show', @buildPlayerInfoBox)
    vent.on('player_position:show', @highlightPosition)
    
  highlightPosition: (player) =>
    @$('.highlight').removeClass('highlight')
    @$('.field .' + player.get("position").toLowerCase()).addClass('highlight')
  
  buildProfileImage: ->
    @$('.picture img.img-polaroid').attr('src', @model.get("club_image_url"))
    
  buildTeamContainer: ->
    @teamView = new StartupSoccerManager.Views.Clubs.Team( collection: @model.get("players") )
    @$('.team').html(@teamView.render().el)
    
  buildSkill: (value, name) =>
    view = new StartupSoccerManager.Views.Players.Skills( model: { name: name, value: value } )
    
    return view.render().el
    
  buildPlayerInfoBox: (player) =>
    if typeof player is "undefined"
      @$('.player-info').hide()
    else if @model.get("id") == player.get("club_id")
      @$('.player-info')
        .fadeOut 'fast', =>
          @$('.player-info .player-picture img').attr('src', player.get("profile_image_url"))
          @$('.player-info .age').html(player.age())
          @$('.player-info .gender').html(player.displayGender())
          @$('.player-info .number').html('#' + player.get("number"))
          @$('.player-info .skills')
            .empty()
            .append( _.map(player.skillAttributes(), @buildSkill) )
        .fadeIn('fast')
      
  positionPlayer: (player, index) =>
    if index < 6
      position = _.compact( _.map(player.positions, player.findPosition) )[0]
      @$('.field')
        .append('<div>#' + player.get("number") + '</div>')
        .find(':last-child')
        .addClass('position' + ' ' + position + ' ' + player.get("position").toLowerCase())
    
  
  buildPositionSoccerField: () ->
    @players.each(@positionPlayer)
    
  render: ->
    @$el.html( template(@template)(@model) )
    @buildProfileImage()
    @buildTeamContainer()
    @buildPlayerInfoBox()
    @buildPositionSoccerField()
    @$el.hide()
    
    return this