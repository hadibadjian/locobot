module Locobot

  class JsonParser

    COMMANDS_KEY = "commands"

    def parse(input)
      JSON.parse(input)[COMMANDS_KEY]
    end

  end

end
