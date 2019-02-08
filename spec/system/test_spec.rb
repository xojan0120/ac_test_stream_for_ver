require 'rails_helper'

RSpec.feature "Tests", type: :system do
  #def mount_path
  #  @mount_path ||= begin
  #    mount = Rails.application.config.action_cable.mount_path
  #    test_host + mount
  #  end
  #end

  #def test_host
  #  host = Capybara.current_session.server.host
  #  post = Capybara.current_session.server.post
  #  "http://#{host}:#{port}"
  #end

  #it "test" do
  #  session = Capybara::Session.new(:selenium_chrome)
  #  session.visit(mount_path)
  #end

  xit "test", js: true do
    FactoryBot.create(:message)
    visit root_path
    click_link "100"

    Capybara.session_name = :new_window
    visit root_path
    click_link "100"
  end
end
