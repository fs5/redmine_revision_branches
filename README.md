# Redmine Revision Branches

_This is a fork of [@tleish](https://github.com/tleish)'s Redmine plugin "Redmine Revision Branches" ([GitHub](https://github.com/tleish/redmine_revision_branches), [Redmine](https://www.redmine.org/plugins/redmine_revision_branches)) which was discontinued in 2020._


## Summary

The "Redmine Revision Branches" plugin adds branch information to the revision detail screen for a specific commit. This is primarily useful when using something like git where a particular commits will be merged into another branch. It supports Git and Mercurial repositories.

### Revision
![Screenshot](https://raw.githubusercontent.com/paginagmbh/redmine_revision_branches/master/docs/screenshot.png)

### Associated Revisions
![Screenshot](https://raw.githubusercontent.com/paginagmbh/redmine_revision_branches/master/docs/screenshot_associated_revisions.png)


## Installation

```
$ cd redmine/plugins
$ git clone https://github.com/paginagmbh/redmine_revision_branches
```

Restart Redmine.


## Configure

Go to Admin > Plugin > Revision Branches > Configure to enable/disable parts of the application.
![Screenshot](https://raw.githubusercontent.com/paginagmbh/redmine_revision_branches/master/docs/screenshot_configure.png)


## License

_redmine_revision_branches_ plugin is developed under the [MIT License](https://github.com/paginagmbh/redmine_revision_branches/blob/master/LICENSE).
