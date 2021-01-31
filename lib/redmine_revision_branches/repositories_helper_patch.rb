# patch for RepositoriesHelper

RepositoriesHelper.class_eval do

  def plugin_redmine_revision_branches(setting)
    return nil unless Setting.plugin_redmine_revision_branches.is_a? Hash
    Setting.plugin_redmine_revision_branches[setting]
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

  def link_to_repository_and_branches(revision)
    return '' unless has_branch_detail?(revision)
    content_tag(:span) do
      concat ' @ '
      concat link_to_repository(revision.repository).html_safe
      concat ' ('
      concat links_to_branches(revision).map{ |link| '<em>' + link + '</em>'}.join(', ').html_safe
      concat ')'
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
