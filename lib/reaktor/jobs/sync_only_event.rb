require 'gitaction/create_action'
require 'logger'

module Reaktor
  module Jobs
    class CreateEvent
      include Event

      @queue   = :resque_create
      @logger ||= Logger.new(STDOUT, Logger::INFO)

      def self.perform(module_name, branch_name)
        @options = { :module_name => module_name,
                     :branch_name => branch_name,
                     :logger => @logger
                   }
        Redis::Lock.new(branch_name, :expiration => 300).lock do
          # do your stuff here ...
          action = Reaktor::GitAction::SyncOnlyAction.new(@options)
          action.setup
          action.sync
        end
      end
    end
  end
end
