require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

  scenario '新規登録に成功すること' do
    visit root_path
    click_link '新規登録'
    perform_enqueued_jobs do
      expect { # rubocop:disable Style/BlockDelimiters
        fill_in 'user[name]', with: 'ExampleUser'
        fill_in 'user[nickname]', with: 'Example'
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[self_introduction]', with: 'Example Introduction'
        fill_in 'user[password]', with: 'foobar'
        fill_in 'user[password_confirmation]', with: 'foobar'
        click_button '新規登録を行う'
      }.to change(User, :count).by(1)
    end
  end
end
