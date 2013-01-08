StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Skills extends Backbone.View
  template: "player_skills_template"
  
  addEmptyStar: ->
    return '<b class="icon-star-empty"></b>'
    
  addFullStar: ->
    return '<b class="icon-star"></b>'
  
  render: ->
    @$el.html( template(@template)(@model) )
    if @model.name == "average"
      @$('.skill-name em').wrap("<strong></strong>")
    @$('.skill-value').append( _(parseInt(@model.value)).times( @addFullStar ) )
    @$('.skill-value').append( _(10 - parseInt(@model.value)).times( @addEmptyStar ) )
    
    return this