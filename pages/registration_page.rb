class RegistrationPage
  include PageObject
  page_url ('http://demo.redmine.org/account/register')
  text_field :login, id: 'user_login'
  text_field :password, id: 'user_password'
  text_field :password_confirmation, id: 'user_password_confirmation'
  text_field :firstname, id: 'user_firstname'
  text_field :lastname, id: 'user_lastname'
  text_field :mail, id: 'user_mail'
  button :submit, name: 'commit'

  def register
    user = rand(9999).to_s + 'user'
    self.login = user
    self.password = 'password'
    self.password_confirmation = 'password'
    self.firstname = 'user_firstname'
    self.lastname = 'user_lastname'
    self.mail = user + '@bla.bla'
    submit
    user
  end
end

