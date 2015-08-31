Quotes = new Mongo.Collection "stockquotes.quotes"

Quotes.attachSchema
  symbol:
    type: String
  exchange:
    type: String
  name:
    type: String
  serverTimestamp:
    type: Date
  lastPrice:
    type: Number
    decimal: true
  tradeTimeStamp:
      type: Date
  netChange:
    type: Number
    decimal: true
  percentChange:
    type: Number
    decimal: true
  open:
    type: Number
    decimal: true
  high:
    type: Number
    decimal: true
  low:
    type: Number
    decimal: true
  close:
    type: Number
    decimal: true
  numTrades:
    type: Number
  dollarVolume:
    type: Number
    decimal: true
  volume:
    type: Number
  previousVolume:
    type: Number
