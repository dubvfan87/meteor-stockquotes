Meteor.methods
  updateQuote: (ticker) ->
    lastQuote = Quotes.findOne(ticker: ticker)

    result = Async.runSync (done) ->
      HTTP.get "http://marketdata.websol.barchart.com/getQuote.json",
        params:
          key: Meteor.settings.private.stockquotes.barchartDataKey
          symbols: ticker
        (err, res) ->
          # Create a new quote or update an existing one
          if err
            throw new Meteor.Error 500, "Could not retrieve quote data from api"

          result = res.data.results[0]
          if not lastQuote
            Quotes.insert
                symbol: result.symbol
                exchange: result.exchange
                name: result.name
                serverTimestamp: result.serverTimestamp
                lastPrice: result.lastPrice
                tradeTimeStamp: result.tradeTimestamp
                netChange: result.netChange
                percentChange: result.percentChange
                open: result.open
                high: result.high
                low: result.low
                close: result.close
                numTrades: result.numTrades
                dollarVolume: result.dollarVolume
                volume: result.volume
                previousVolume: result.previousVolume
          else
            Quotes.update
                _id: lastQuote._id,
                $set:
                  symbol: result.symbol
                  exchange: result.exchange
                  name: result.name
                  serverTimestamp: result.serverTimestamp
                  lastPrice: result.lastPrice
                  tradeTimeStamp: result.tradeTimestamp
                  netChange: result.netChange
                  percentChange: result.percentChange
                  open: result.open
                  high: result.high
                  low: result.low
                  close: result.close
                  numTrades: result.numTrades
                  dollarVolume: result.dollarVolume
                  volume: result.volume
                  previousVolume: result.previousVolume
