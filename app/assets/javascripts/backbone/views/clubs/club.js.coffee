StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Club extends Backbone.View
  tagName: 'tr'

  className: 'inactive'
  
  template: 'club_template'
  
  events:
    'click .btn-destroy': 'destroy'
    'click .clickable': 'displayDetails'
    
  destroy: ->
    @model.destroy()
    if @clubShowView?
      @clubShowView.remove()
    @remove()
    
    return false
  
  closeDetails: ->
    @$el.addClass('inactive')
    @$el.next().fadeOut('slow', ->
      $(@).remove()
    )
    
  openDetails: ->
    @clubShowView = new StartupSoccerManager.Views.Clubs.Show( model: @model )
    @$el.removeClass('inactive')
    @$el.after(@clubShowView.render().el)
    @$el.next().fadeIn('slow')

  displayDetails: ->
    if (@$el.hasClass('inactive'))
      @openDetails()
    else
      @closeDetails()
        
  render: =>
    @$el.html( template(@template)(@model) )
    
    return this
