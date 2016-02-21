class AccountPage
  include PageObject
  page_url('http://demo.redmine.org/my/account')
  link :logout, class: 'logout'
  link :my_account, class: 'my-account'
  link :change_password, class: 'icon-passwd'
  link :go_to_project_page, class: 'projects'

  def go_to_password_page
    my_account
    change_password_element.when_visible
    change_password
  end

end