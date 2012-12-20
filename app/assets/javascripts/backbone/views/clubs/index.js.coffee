StartupSoccerManager.Views.Clubs ||= {}

class StartupSoccerManager.Views.Clubs.Index extends Backbone.View
  tagName: 'table'
  
  className: 'table'
  
  template: 'clubs_template'
  
  addOne: (club) =>
    @clubView = new StartupSoccerManager.Views.Clubs.Club( model: club )
    @$('tbody').append(@clubView.render().el)
  
  render: =>
    @$el.html( template(@template) )
    @collection.each(@addOne)
    
    return this