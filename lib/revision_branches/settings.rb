module RevisionBranches
  module Settings
    def self.is_set?(setting)
      return false unless Setting.plugin_redmine_revision_branches.is_a? Hash
      !!Setting.plugin_redmine_revision_branches[setting]
    end
  end
end
