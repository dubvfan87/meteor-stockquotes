Meteor.publish 'stockquotes.quotes', (ticker) ->
  Quotes.find symbol: ticker
