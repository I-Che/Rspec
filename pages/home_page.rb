class HomePage
  include PageObject
  link :login, class: 'login'
  link :username, css: '#loggedas a'
end