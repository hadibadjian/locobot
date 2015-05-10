require 'commands/base'

module Locobot

  module Commands

    class Report < Base
      def valid?
        true
      end

      def exec(position)
        position
      end
    end

  end

end
