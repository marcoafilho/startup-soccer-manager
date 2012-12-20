StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Club extends Backbone.View
  tagName: 'tr'
  
  template: 'club_template'
  
  render: =>
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this
