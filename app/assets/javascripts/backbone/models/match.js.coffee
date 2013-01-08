class StartupSoccerManager.Models.Match extends Backbone.Model
  paramRoot: 'match'
  
  defaults:
    guest_id: null
    guest_score: null
    host_id: null
    host_score: null
    location: null
    played_at: null