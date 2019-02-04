# Rubira
Rubyesque interaction with the JIRA API.

## Install

```
gem install rubira
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

require 'rubira'

jql = "project = RAD AND updatedDate >= -1d"

# Use a block to print out a list of issues.
Rubira::Issue.search(jql).each do |issue|
  puts "#{issue.key}: #{issue.summary}"
end

# Store an array of issues.
issues = Rubira::Issue.search(jql)

# Print out a list of comments.
issues.first.comments.each do |comment|
  puts "#{created} #{author} #{body.truncate(42)}"
end
```

## Documentation

The code is meant to be self-documenting... and I really mean that.

For example, if you open up `lib/rubira/base_issue.rb`, you'll see something
like this at the top:

```ruby
  attribute :id
  attribute :key
  attribute :summary,     key: %w[fields summary]
  attribute :description, key: %w[fields description]
  attribute :summary,     key: %w[fields summary]
  attribute :summary,     key: %w[fields summary]
  attribute :type,        key: %w[fields issuetype], type: Rubira::IssueType
  attribute :status,      key: %w[fields status],    type: Rubira::IssueStatus
  attribute :priority,    key: %w[fields priority],  type: Rubira::Priority
```

Each of those are attributes that can be accessed on instances of `Rubira::BaseIssue`.
Note, that typically, issues are of type `Rubira::Issue`, which extends
`Rubira::BaseIssue` and adds on the following attributes:

```ruby
    person     :reporter,    key: %w[fields creator]
    person     :assignee,    key: %w[fields assignee]
    collection :components,  key: %w[fields components], type: Rubira::Component
    collection :issue_links, key: %w[fields issuelinks], type: Rubira::IssueLink
    timestamp  :created,     key: %w[fields created]
    timestamp  :updated,     key: %w[fields updated]
```

Here you can see three new types of attributes:
* `person` creates attributes of the type `Rubira::Person`
* `collection` creates an array of the type specified, e.g. `Rubira::Component`
* `timestamp` creates attributes of the type `Rubira::Timestamp` (which is
  essentially `DateTime`)

Please wander around the code a bit and let me know what you
think---questions, suggestions, and criticisms are all welcome.

## TODO

- [x] Add rubocop.
- [ ] Add testing.  (This is in progress.)
- [ ] Add CI.
- [ ] Switch from `HTTParty` to `Net::HTTP`.  As much as I love `HTTParty`, I'd
  rather not have any external dependencies... outside the JIRA API, of course.
- [ ] Suport OAuth.
- [ ] Support JIRA REST v3.
- [ ] Add the ability to write to the API, not just read.
- [ ] Add more resources (e.g. versions).

## Why the name "Rubira"?

* Ruby + JIRA = Rubira
* Etymology of JIRA is from "gojira" which is the Japanese word for
  "Godzilla".
* The name Rubira is also based off the name of a "giant lobster" monster
  named [Ebirah](https://en.wikipedia.org/wiki/Ebirah) that Godzilla fought.
  Lobsters are red.  Rubies are red.  It's perfect!

## Help and Docs

* https://developer.atlassian.com/cloud/jira/platform/rest/v2/

## Contributing

* Fork the project.
* Add your magic.
* Add tests.
* Send me a pull request.
