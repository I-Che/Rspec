class LoginPage
  include PageObject
  page_url('http://demo.redmine.org/login')
  text_field :username, id: 'username'
  text_field :password, id: 'password'
  button :submit, name: 'login'

  def submit_valid_credentials(user)
    username_element.when_visible
    self.username = user
    password_element.when_visible
    self.password = 'password'
    submit
  end

  def submit_new_login_infomation(user)
    username_element.when_visible
    self.username = user
    password_element.when_visible
    self.password = 'new_password'
    submit
  end

end
