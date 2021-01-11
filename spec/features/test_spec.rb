require 'rails_helper'


RSpec.feature "ページの表示", type: :feature do

# 変数定義
let(:user) { FactoryBot.create(:user) } 

  scenario "ホームページの表示" do
    visit root_path
  end

  scenario "aboutページの表示" do
    visit static_pages_about_path
  end

  scenario "helpページの表示" do
    visit static_pages_help_path
  end

  scenario "signupページの表示" do
    visit signup_path
  end

  # scenario "userの詳細ページの表示" do
  #   visit user_path
  # end
end
