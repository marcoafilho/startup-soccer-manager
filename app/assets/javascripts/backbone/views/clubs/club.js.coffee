StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Club extends Backbone.View
  tagName: 'tr'
  
  template: 'club_template'
  
  events:
    'click .btn-destroy': 'destroy'
    
  destroy: ->
    @model.destroy()
    @remove()
    
    return false
  
  render: =>
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this
