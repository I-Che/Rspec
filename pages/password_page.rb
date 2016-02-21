class PasswordPage
  include PageObject
  page_url('http://demo.redmine.org/my/password')

  text_field :password, id: 'password'
  text_field :new_password, id: 'new_password'
  text_field :new_password_confirmation, id: 'new_password_confirmation'
  button :submit, name: 'commit'
  div :flash_notice, id: 'flash_notice'

  def create_new_password
    password_element.when_visible
    self.password = 'password'
    self.new_password = 'new_password'
    self.new_password_confirmation = 'new_password'
    submit
  end

end