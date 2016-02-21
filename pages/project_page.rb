class ProjectPage
  include PageObject
  link :add_project, class: 'icon-add'
  text_field :project_name, id: 'project_name'
  text_field :project_identifier, id: 'project_identifier'
  button :submit, name: 'commit'
  link :go_to_version_tab, id: 'tab-versions'
  link :add_version, xpath: "//*[@id='tab-content-versions']/p[2]/a"
  div :flash_notice, id: 'flash_notice'
  text_field :version_name, id: 'version_name'

  def create_new_project
    add_project_element.when_visible
    add_project
    project=rand(9999).to_s + 'project'
    project_name_element.when_visible
    self.project_name=  project
    project_identifier_element.when_visible
    self.project_identifier = project
    submit
  end

  def create_new_version
    version=rand(999).to_s + 'version'
    add_version_element.when_visible
    add_version
    version_name_element.when_visible
    version_name
    self.version_name = version
    submit
  end
 end


