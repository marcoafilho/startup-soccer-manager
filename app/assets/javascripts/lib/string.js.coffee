String::humanize = ->
  return @toLowerCase().replace(/_/g, ' ').replace(/(\w+)/g, (match) ->
      return match.charAt(0).toUpperCase() + match.slice(1)
    )