class StartupSoccerManager.Models.Match extends Backbone.Model
  paramRoot: 'match'
  
  defaults:
    guest_id: null
    guest_score: null
    host_id: null
    host_score: null
    location: null
    played_at: ""
    
  validate: (attrs, options) ->
    unless attrs.played_at?
      return "can't be blank"
    
  initialize: ->
    @set("host", new StartupSoccerManager.Models.Club(@get("host")))
    @set("guest", new StartupSoccerManager.Models.Club(@get("guest")))
    
  playedAtArray: ->
    @get("played_at").substring(0, 10)
    
  playDate: ->
    playedAt = @playedAtArray().split('-')
    
    new Date(playedAt[0], (playedAt[1] - 1), playedAt[2])
    
  toJSON: ->
    json = _.clone(@attributes)
    delete json.host
    delete json.guest
    
    json