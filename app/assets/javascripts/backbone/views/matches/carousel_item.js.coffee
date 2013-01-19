StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.CarouselItem extends Backbone.View
  className: "item"
    
  template: "matches_carousel_item"
  
  render: ->
    @$el.html( template(@template)(@model) )
    
    this