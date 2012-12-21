Date::age = ->
  today = new Date()
  age = today.getFullYear() - @getFullYear()
  month = today.getMonth() - @getMonth()
  age-- if ( month < 0 || (month == 0 and today.getDate() < @getDate()))
  
  return age