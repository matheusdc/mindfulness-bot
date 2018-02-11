# mindfulness-bot

mindfulness-bot is a chat bot built on the Hubot framework. Its purpouse is to send messages with mindfulness quotes when requested. Besides that, it also supports commands to provide quotes from specified authors and quotes with specified keywords on it.

There are some other features in its roadmap for future versions, such as defining a specific period of the day to receive a mindfulness quote, but that requires heavy changes on its architecture and design, so it might take some time.

Currently, there are 76 quotes from many people, including Buddha, Jon Kabat-Zinn, Jack Kornfield and Amit Ray. The initial set of quotes was taken from this [page](https://positivepsychologyprogram.com/mindfulness-quotes/).

There is a running instance configured with Telegram adapter, and can be accessed by this [link](https://t.me/MindfulnessQuotesBot).

### Running mindfulness-bot Locally

You can start mindfulness-bot locally by running:

    % bin/hubot

### Available commands

The following commands are currently supported:

    * quote - Get a random mindfulness quote
    * quotefrom <author> - Get a random quote from a specified author
    * quoteabout <keyword> - Get a random quote that contains a specified keyword

The commands where adapted for Telegram Bot API.