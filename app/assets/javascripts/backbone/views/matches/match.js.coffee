StartupSoccerManager.Views.Matches ||= {}

class StartupSoccerManager.Views.Matches.Match extends Backbone.View
  tagName: "tr"
  
  template: "match_template"
  
  events:
    'click .btn-destroy': 'destroy'
    
  destroy: ->
    @model.destroy()
    @remove()
    
    return false
  
  render: ->
    @$el.html( template(@template)(@model.toJSON()) )
    
    return this