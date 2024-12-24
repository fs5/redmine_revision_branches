require_relative './revision_branches/settings'

module RepositoriesHelperPatches
  RepositoriesHelper.class_eval do

    def display_branches_under_associated_revisions?
      RevisionBranches::Settings::is_set?('display_under_associated_revisions')
    end

    def has_branch_detail?(revision)
      revision.repository.scm.respond_to? :branch_contains
    end

    def insert_branches_detail(html, revision)
      return html unless has_branch_detail?(revision)
      substring = '</li>'
      location = html.index(substring).to_i + substring.length
      html.insert(location, branches_html(revision))
    end

    def branches_html(revision)
      content_tag(:li) do
        content = content_tag(:strong, "#{l(:label_branch)}")
        content << " "
        content << "#{@repository.identifier} @ "
        content << links_to_branches(revision).join(', ').html_safe
      end
    end

    def link_to_repository(repository)
      link_to(repository.identifier, {
        :controller => 'repositories',
        :action => 'show',
        :id => repository.project,
        :repository_id => repository.identifier,
        :path => to_path_param(@path)})
    end

    def links_to_branches(revision)
      branch_names(revision).map { |name| branch_link(revision.repository, name) }
    end

    def branch_link(repository, branch)
      link_to(branch, {
        :controller => 'repositories',
        :action => 'show',
        :id => repository.project,
        :repository_id => repository.identifier,
        :path => to_path_param(@path),
        :rev => branch
      }).html_safe
    end

    def branch_names(revision)
      revision.repository.scm.branch_contains(revision.identifier)
    end

  end
end
