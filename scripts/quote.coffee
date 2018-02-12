# Description:
#   Script that allows hubot to send mindfulness quotes to users

quotes = require('./quotes.json')

module.exports = (robot) ->
  # Mindfulness quote
  # The bot replies with a random quote
  robot.hear /(\/)?quote(@mindfulnessQuotesBot)?$/i, (res) ->
    # selecting a random quote from the quotes array
    randomQuote = res.random quotes
    res.reply '"' + randomQuote.quote + '"  ' + randomQuote.author


  # Mindfulness quote from author
  # The bot replies with a random quote from the specified author
  robot.hear /(\/)?quotefrom(@mindfulnessQuotesBot)?\s?(.*)?/i, (res) ->
    # getting the author
    author = res.match[3]
    #  checking if there is an author
    if typeof author == 'undefined' || author.length <= 0
      # informing the user and exiting
      res.reply 'Please, specify an author'
      return

    # filtering the array for a specific author
    quotesFromSpecificAuthor = quotes.filter (quote) ->
      if quote.author == author
        return true

    # if the author has any quote on bot's database
    if quotesFromSpecificAuthor.length > 0
      # selecting a random quote from the quotesFromSpecificAuthor array
      randomQuote = res.random quotesFromSpecificAuthor
      res.reply '"' + randomQuote.quote + '"  ' + randomQuote.author
    else
      res.reply 'Sorry, couldn\'t find any quotes from that author'


  # Mindfulness quote about keyword
  # The bot replies with a random quote with a specific keyword
  robot.hear /(\/)?quoteabout?(@mindfulnessQuotesBot)?\s?(.*)/i, (res) ->
    # getting the keyword
    keyword = res.match[3]
    #  checking if there is a keyword
    if typeof keyword == 'undefined' || keyword.length <= 0
      # informing the user and exiting
      res.reply 'Please, specify a keyword'
      return

    # filtering the array for a specific keyword in quotes
    quotesWithSpecificKeyword = quotes.filter (quote) ->
      # trying to find the keyword on quotes
      if quote.quote.indexOf(keyword) > 0
        return true
    
    # if there is quotes for that specific keyword
    if quotesWithSpecificKeyword.length > 0
      # selecting a random quote from the quotesWithSpecificKeyword array
      randomQuote = res.random quotesWithSpecificKeyword
      res.reply '"' + randomQuote.quote + '"  ' + randomQuote.author
    else
      res.reply 'Sorry, couldn\'t find any quotes with that keyword'

  # Error handling
  # The bot replies with error message and log a [FIX ME] tag on the console
  robot.error (err, res) ->
    robot.logger.error '[FIX ME] Something went wrong here!'
    if res?
      res.reply 'Sorry, I couldn\'t understand what you asked for...'