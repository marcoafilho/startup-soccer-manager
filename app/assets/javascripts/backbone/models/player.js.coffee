class StartupSoccerManager.Models.Player extends Backbone.Model
  paramRoot: 'player'
  
  defaults:
    first_name: null
    last_name: null
    born_at: null
    sex: true
    
    position: null
    number: 1
    
    acceleration: 5
    aggression: 5
    balance: 5
    marking: 5
    stamina: 5