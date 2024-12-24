require_relative './revision_branches/settings'

module RepositoriesControllerPatches

  module PrependMethods
    def revision
      revision_with_git_branches
    end
  end

  def self.included(base)
    base.class_eval {
      include InstanceMethods
      alias_method :revision_without_git_branches, :revision
      prepend PrependMethods
    }
  end

  module InstanceMethods
    def revision_with_git_branches
      if RevisionBranches::Settings::is_set?('display_under_single_revision')
        respond_to do |format|
          format.html {render :template => 'repositories/revision_with_git_branches'}
          format.js {render :layout => false}
        end
      else
        revision_without_git_branches
      end
    end
  end
end

RepositoriesController.send(:include, RepositoriesControllerPatches)
