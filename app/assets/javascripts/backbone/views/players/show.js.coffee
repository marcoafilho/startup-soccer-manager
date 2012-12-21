StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Show extends Backbone.View
  tagName: "tr"
  
  template: "show_player_template"
    
  buildSkill: (value, name) =>
    view = new StartupSoccerManager.Views.Players.Skills( model: { name: name, value: value } )
    
    return view.render().el
    
  buildProfileImage: ->
    @$('.picture img.img-polaroid').attr('src', @model.get("profile_image_url"))
    
  findPosition: (value, name) =>
    if _.contains(@model.positions[name], @model.get("position"))
      return name
  
  buildPlayerPositionContainer: ->
    position = _.compact( _.map(@model.positions, @findPosition) )[0]
    @$('.position')
      .addClass( position )
      .addClass( @model.get("position").toLowerCase() )
  
  buildSkillsContainer: ->
    @$('.skills').append( _.map(@model.skillAttributes(), @buildSkill) )
  
  render: ->
    @$el.html( template(@template)(@model) )
    @buildProfileImage()
    @buildSkillsContainer()
    @buildPlayerPositionContainer()
    @$el.hide()
    
    return this