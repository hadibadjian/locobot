require 'commands/base'

module Locobot

  module Commands

    class Report < Base
      private
        def validity_expression
          /^REPORT$/
        end
    end

  end

end
