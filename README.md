# jirad
Rubyesque interaction with the JIRA API.

## Install

```
gem install jirad
```

Ok, so it's not gemified yet... but soon!  :)

## Requirements

* HTTParty (this will eventually go away, but it's so easy)

## Examples

Set these environment variables using something like [direnv](https://direnv.net/):
* `JIRA_USERNAME`
* `JIRA_PASSWORD`
* `JIRA_SITE`

```ruby

require 'jirad'

jql = "project = RAD AND updatedDate >= -1d"

# Use a block to print out a list of issues.
Jirad::Issue.search(jql).each do |issue|
  puts "#{issue.key}: #{issue.summary}"
end

# Store an array of issues.
issues = Jirad::Issue.search(jql)

# Print out a list of comments.
issues.first.comments.each do |comment|
  puts "#{created} #{author} #{body.truncate(42)}"
end
```

## Documentation

The code is meant to be self-documenting... and I really mean that.

For example, if you open up `lib/jirad/base_issue.rb`, you'll see something
like this at the top:

```ruby
  attribute :id
  attribute :key
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :description, key: [ 'fields', 'description' ]
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :type,        key: [ 'fields', 'issuetype' ], type: Jirad::IssueType
  attribute :status,      key: [ 'fields', 'status' ],    type: Jirad::IssueStatus
  attribute :priority,    key: [ 'fields', 'priority' ],  type: Jirad::Priority
```

Each of those are attributes that can be accessed on instances of `Jirad::BaseIssue`.
Note, that typically, issues are of type `Jirad::Issue`, which extends
`Jirad::BaseIssue` and adds on the following attributes:

```ruby
  person :reporter,        key: [ 'fields', 'creator' ]
  person :assignee,        key: [ 'fields', 'assignee' ]
  collection :components,  key: [ 'fields', 'components' ], type: Jirad::Component
  collection :issue_links, key: [ 'fields', 'issuelinks' ], type: Jirad::IssueLink
  timestamp :created,      key: [ 'fields', 'created' ]
  timestamp :updated,      key: [ 'fields', 'updated' ]
```

Here you can see three new types of attributes:
* `person` creates attributes of the type `Jirad::Person`
* `collection` creates an array of the type specified, e.g. `Jirad::Component`
* `timestamp` creates attributes of the type `Jirad::Timestamp` (which is
  essentially `DateTime`)

Please wonder around the code a bit and let me know what you
think---questions, suggestions, and criticisms are all welcome.

## TODO

* Add testing... (this is embarassing, but you can rest assured I will do this
  VERY soon)
* Switch from `HTTParty` to `Net::HTTP`.  As much as I love `HTTParty`, I'd
  rather not have any external dependencies... outside the JIRA API, of course.
* Suport OAuth.
* Support JIRA REST v3.

## Contributing

* Fork the project.
* Add your magic.
* (I'd say to add tests... but I haven't even added tests yet.)
* Send me a pull request.
