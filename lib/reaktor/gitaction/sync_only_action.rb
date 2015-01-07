module Reaktor
module GitAction
class SyncOnlyAction < Action
    
    def initialize(options = {})
      super(options)
      logger.info("In #{self}")
    end
    
    def setup
      logger.info("branch = #{self.branch_name}")
    end
    
    def syncOnly     
      Notification::Notifier.instance.notification = "r10k deploy environment for #{branch_name} in progress..."
      result = r10k_deploy_env self.branch_name
      if result.exited?
        Notification::Notifier.instance.notification = "r10k deploy environment for #{branch_name} finished"
      end
    end
end