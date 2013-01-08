StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.Index extends Backbone.View
  className: "matches-index"
    
  template: "matches_template"
  
  addOne: (match) =>
    @view = new StartupSoccerManager.Views.Matches.Match( model: match )
    @$('tbody').append(@view.render().el)
  
  render: ->
    @$el.html( template(@template) )
    @collection.each(@addOne)
    
    return this
