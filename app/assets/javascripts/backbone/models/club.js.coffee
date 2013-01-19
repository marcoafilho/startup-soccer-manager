class StartupSoccerManager.Models.Club extends Backbone.Model
  paramRoot: 'club'
  
  defaults:
    name: null
    founded_at: null
    
    club_image_url: "assets/clubs/default.png"
    
    players: []
    
  initialize: ->
    @objectPlayers = new StartupSoccerManager.Collections.Players()
    @objectPlayers.reset @get("players")
    
  validate: (attrs) ->
    "Name shouldn't be empty" if attrs.name? and attrs.name == ""
        
  foundationYear: ->
    @get("founded_at").substring(0, 4)
    
  average: ->
    if @objectPlayers.length > 0
      averages = @objectPlayers.map (player) ->
        player.average()
      finalAverage = _.reduce averages, (sum, n) =>
        sum += n
      Math.round(finalAverage / @objectPlayers.length)
    else
      0
    
  addEmptyStar: ->
    return '<b class="icon-star-empty"></b>'

  addFullStar: ->
    return '<b class="icon-star"></b>'
      
  displayAverage: ->
    _(Math.round(@average())).times(@addFullStar).concat(_(Math.round(10 - @average())).times(@addEmptyStar)).join('')