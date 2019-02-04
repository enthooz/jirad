# frozen_string_literal: true

FactoryHelper.define(:issue, parent: :base_issue) do
  site        = Faker::Internet.domain_word
  key         = "RAD-#{Faker::Number.number(4)}"
  id          = Faker::Number.number(5)
  summary     = Faker::HitchhikersGuideToTheGalaxy.starship
  description = Faker::Lebowski.quote
  {
    "expand" => "operations,versionedRepresentations,editmeta,changelog,renderedFields",
    "fields" => {
      'issuetype'                     => FactoryHelper.build_from(:issue_type),
      'priority'                      => FactoryHelper.build_from(:priority),
      'status'                        => FactoryHelper.build_from(:issue_status),
      "project"                       => FactoryHelper.build_from(:project),
      "creator"                       => FactoryHelper.build_from(:person),
      "reporter"                      => FactoryHelper.build_from(:person),
      "timespent"                     => nil,
      "fixVersions"                   => [],
      "aggregatetimespent"            => nil,
      "resolution"                    => nil,
      "resolutiondate"                => nil,
      "workratio"                     => -1,
      "lastViewed"                    => "2019-02-04T06:53:36.819-0800",
      "created"                       => "2019-02-04T06:48:32.388-0800",
      "labels"                        => [],
      "timeestimate"                  => nil,
      "aggregatetimeoriginalestimate" => nil,
      "versions"                      => [],
      "issuelinks"                    => [],
      "assignee"                      => nil,
      "updated"                       => "2019-02-04T06:53:36.764-0800",
      "components"                    => [],
      "timeoriginalestimate"          => nil,
      "description"                   => description,
      "security"                      => nil,
      "aggregatetimeestimate"         => nil,
      "summary"                       => summary,
      "subtasks"                      => [],
      "environment"                   => nil,
      "duedate"                       => nil,
      "watches" => {
        "self"       => "https://#{site}.atlassian.net/rest/api/2/issue/#{key}/watchers",
        "watchCount" => 1,
        "isWatching" => true
      },
      "aggregateprogress" => {
        "progress" => 0,
        "total"    => 0
      },
      "progress" => {
        "progress" => 0,
        "total"    => 0
      },
      "votes" => {
        "self"     => "https://#{site}.atlassian.net/rest/api/2/issue/#{key}/votes",
        "votes"    => 0,
        "hasVoted" => false
      }
    }
  }




end
