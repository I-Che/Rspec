class IssuePage
  include PageObject
  link :creating_issue, class: 'new-issue'
  select_list :issues_list, css: '#issue_tracker_id'
  text_field :issue_subject, id:'issue_subject'
  button :submit, name: 'continue'
  link :go_to_issues, class:'issues'
  table :issues_table, xpath: ".//*[@id='content']/form[2]/div/table"

   def add_issue_bug
     creating_issue_element.when_visible
     creating_issue
     issue_subject_element.when_visible
     self.issue_subject = 'Bug'
     submit
   end

   def add_issue_feature
     issues_list_element.select('Feature')
     issue_subject_element.when_visible
     self.issue_subject = 'Feature'
     submit
   end

  def add_issue_support
    issues_list_element.select ('Support')
    issue_subject_element.when_visible
    self.issue_subject = 'Support'
    submit
  end
end