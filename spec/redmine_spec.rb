require_relative '../spec/spec_helper'

describe 'Positive Redmine Test' do
  describe 'Register user by submit valid credentials' do
    before (:all) do
      visit(RegistrationPage)
      @user = on(RegistrationPage).register
    end
    context 'Logged user with valid credentials' do
      before (:all) do
        on(AccountPage).logout
        on(HomePage).login
        on(LoginPage).submit_valid_credentials(@user)
      end
      it "User is logged in" do
        expect(on(HomePage).username_element.when_visible(10).text).to include @user
      end
    end
    describe 'Test changing password' do
      context 'When user changes password' do
        before (:all) do
          on(AccountPage).go_to_password_page
          on(PasswordPage).create_new_password
        end
        it "Password was changed with informed message " do
          expect(on(PasswordPage).flash_notice_element.text).to include 'Пароль успешно обновлён.'
        end
        context 'Password was updated in the database' do
          before (:all) do
            on(AccountPage).logout
            on(HomePage).login
            on(LoginPage).submit_new_login_infomation (@user)
          end
        end
        describe 'Test Creating Project' do
          context 'When new project was created' do
            before (:all) do
              on(AccountPage).go_to_project_page
              on(ProjectPage).create_new_project
            end
            it "New project was created with message" do
              expect(on(ProjectPage).flash_notice_element.text).to include 'Создание успешно.'
            end
            context 'When version of new project was created' do
              before (:all) do
                on(ProjectPage).go_to_version_tab
                on(ProjectPage).create_new_version
              end
              it "New version was created with message" do
                expect(on(ProjectPage).flash_notice_element.text).to include 'Создание успешно.'
              end
            end
            describe 'Test editing users roles in project' do
              context 'Register user for members list'
              before (:all) do
                on(AccountPage).logout
                visit(RegistrationPage)
                on(RegistrationPage).register
              end
              context 'Create new project' do
                before (:all) do
                  on(AccountPage).go_to_project_page
                  on(ProjectPage).create_new_project
                end
                context 'Registered user was added to the project'
                before (:all) do
                  on(MembersPage).go_to_members_list
                  on(MembersPage).add_some_member (@user)
                end
                it 'Verifying that user was added to the project' do
                  expect(on(MembersPage).list_members_table).to include 'user'
                end
                context 'Added developer users role' do
                  before (:all) do
                    on(MembersPage).edit_users_roles
                  end
                  it 'In users roles list appeared new role' do
                    expect(on(MembersPage).list_members_table).to include 'Developer'
                  end
                end
                describe 'Test creating all types of issues' do
                  context 'When new project was created' do
                    before (:all) do
                      on(AccountPage).go_to_project_page
                      on(ProjectPage).create_new_project
                    end
                    context 'Created bug, feature and support issue' do
                      before (:all) do
                        on(IssuePage).add_issue_bug
                        on(IssuePage).add_issue_feature
                        on(IssuePage).add_issue_support
                        on(IssuePage).go_to_issues
                      end
                      context 'New issues were added to the project' do
                        it 'Bug, feature and support issue are visible on Issues_tab' do
                          expect(on(IssuePage).issues_table).to include 'Support'
                          expect(on(IssuePage).issues_table).to include 'Feature'
                          expect(on(IssuePage).issues_table).to include 'Bug'
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end








