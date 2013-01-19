StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.Index extends Backbone.View
  className: "matches-index"
    
  template: "matches_template"
  
  addOne: (match) =>
    @view = new StartupSoccerManager.Views.Matches.Match( model: match )
    @$('tbody').append(@view.render().el)
    
  buildCarousel: ->
    @carousel ||= @$('#matches_carousel')
    @collection.each(@buildCarouselItem)
    @carousel.find('.carousel-inner').children().first().addClass("active")
    @carousel.carousel()
    
  buildCarouselItem: (match) =>
    if match.get("host_score")? and match.get("guest_score")?
      @carouselView = new StartupSoccerManager.Views.Matches.CarouselItem( model: match )
      @carousel.find('.carousel-inner').append(@carouselView.render().el)
  
  render: ->
    @$el.html( template(@template) )
    @collection.each(@addOne)
    @buildCarousel()
    
    this
