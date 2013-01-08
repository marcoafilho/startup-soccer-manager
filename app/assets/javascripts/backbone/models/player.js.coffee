class StartupSoccerManager.Models.Player extends Backbone.Model
  paramRoot: 'player'
  
  defaults:
    first_name: null
    last_name: null
    born_at: ""
    gender: true
    
    position: "GK"
    number: 1
    
    acceleration: 5
    aggression: 5
    balance: 5
    marking: 5
    stamina: 5
    
    profile_image_url: 'assets/players/default.png'
    
  positions:
    offense:
      ss: "SS"
      cf: "CF"
      w: "W"
    mid_field:
      dm: "DM"
      cm: "CM"
      sm: "SM"
      am: "AM"
    defense:
      sw: "SW"
      cb: "CB"
      fb: "FB"
      wb: "WB"
    goal:
      gk: "GK"
    
  initialize: ->
    @initializeClub() if @get('club')
    _.bindAll(this, "average")
    
  initializeClub: ->
    @set('club', new StartupSoccerManager.Models.Club(@get('club')))
    
    return @get('club')
    
  average: ->
    return  @skillsSum() / 5
    
  age: ->
    return new Date(@get('born_at')).age()
    
  displayAverage: ->
    _(Math.round(@average())).times(@addFullStar).concat(_(Math.round(10 - @average())).times(@addEmptyStar)).join('')
    
  displayClubName: ->
    if @get('club')?
      @get('club').get('name')
    else
      "No club"
  
  displayGender: ->
    if @get('gender') == true or @get('gender') == "true"
      "Male"
    else
      "Female"
    
  displayPosition: ->
    '<span class="' + _.compact( _.map(@positions, @findPosition) )[0] + '">' + @get("position") + '</span>'
    
  findPosition: (value, name) =>
    if _.contains(@positions[name], @get("position"))
      return name
    
  addEmptyStar: ->
    return '<b class="icon-star-empty"></b>'

  addFullStar: ->
    return '<b class="icon-star"></b>'
        
  formattedName: ->
    return @get('last_name').toUpperCase() + ', ' + @get('first_name')
    
  fullName: ->
    return @get('first_name') + ' ' + @get('last_name')
        
  skillAttributes: ->
    acceleration: @get("acceleration") 
    aggression: @get("aggression")
    balance: @get("balance")
    marking: @get("marking")
    stamina: @get("stamina")
    average: Math.round(@average())
        
  skillsSum: ->
    return parseInt(@get('acceleration')) + parseInt(@get('aggression')) + parseInt(@get('balance')) + parseInt(@get('marking')) + parseInt(@get('stamina'))