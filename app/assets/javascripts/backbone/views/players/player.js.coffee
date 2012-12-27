StartupSoccerManager.Views.Players ||= {}

class StartupSoccerManager.Views.Players.Player extends Backbone.View
  tagName: 'tr'
  
  className: 'inactive'

  template: "player_template"
  
  events:
    'click .btn-destroy': 'destroy'
    'click .clickable': 'displayDetails'
    
  closeDetails: ->
    @$el.addClass('inactive')
    @$el.next().fadeOut('slow', ->
      $(@).remove()
    )
    
  displayDetails: ->
    if (@$el.hasClass("inactive"))
      @openDetails()
    else
      @closeDetails()
        
  destroy: ->
    @model.destroy()
    if @showPlayerView?
      @showPlayerView.remove()
    @remove()

    return false
    
  openDetails: ->
    @showPlayerView = new StartupSoccerManager.Views.Players.Show( model: @model )
    @$el.removeClass('inactive')
    @$el.after(@showPlayerView.render().el)
    @$el.next().fadeIn('slow')
  
  render: =>
    @$el.html( template(@template)(@model) )
    
    return this