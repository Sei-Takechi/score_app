require 'rails_helper'

RSpec.feature "static_pages", type: :feature do
  it "ホームページの表示" do
    visit root_path
  end

  it "aboutページの表示" do
    visit static_pages_about_path
  end

  it "helpページの表示" do
    visit static_pages_help_path
  end
end
