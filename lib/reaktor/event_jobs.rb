module Reaktor
  module EventJobs
    require 'jobs/event'
    require 'jobs/create_event'
    require 'jobs/delete_event'
    require 'jobs/modify_event'
    require 'jobs/sync_only_event'
    require 'jobs/controller'
    require 'jobs/github_controller'
    require 'jobs/gitlab_controller'
  end
end