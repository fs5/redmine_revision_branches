class IssueRevisionHooks < Redmine::Hook::ViewListener
    render_on :view_issues_history_changeset_bottom, :partial => 'issues/revision_branches'
end
