require 'redmine/scm/adapters/git_adapter'

module Redmine
  module Scm
    module Adapters
      class GitAdapter
        def branch_contains(hash)
          cleaned_hash = hash.sub(/[^\w]/, '')
          cmd_args = ['branch', '--no-color', '--contains', cleaned_hash]
          begin
            branches = git_cmd(cmd_args) do |io|
              io.readlines.map {|t| scm_iconv('UTF-8', @path_encoding, t)}.sort!.map {|t| t.strip.gsub(/\* ?/, '')}
            end
          rescue ScmCommandAborted
            branches = Array.new
          end
          branches.uniq
        end
      end
    end
  end
end
