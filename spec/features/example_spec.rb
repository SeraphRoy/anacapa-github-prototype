require 'rails_helper.rb'

include Warden::Test::Helpers
Warden.test_mode!

# sleep(inspection_time=3)

feature "Have Login", js:true, :sauce => true do
  scenario "Have Login" do
    visit 'http://anacapa-github-prototype.herokuapp.com/'
    expect(page).to have_content 'Sign in with GitHub'
  end
end

feature "Logging In", js: true, :sauce => true do
  before(:each) do
    @user = FactoryGirl.create(:user, name:"Test Name")
    login_as @user, :scope => :user
  end
  scenario "Logging Out" do
    visit 'http://anacapa-github-prototype.herokuapp.com/'
    page.find(:xpath, "//*[@id='navbar']/ul/li/a").click
    #click_link('Test Name')
    #click_link('Sign Out')
    expect(page).to have_content 'Sign in to GitHub'
  end
end
