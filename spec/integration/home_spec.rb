require 'spec_helper'

class Home
  include Capybara::DSL
  def visit_homepage
    visit('/products')
  end
end

feature "Visit homepage" do
  let(:home) {Home.new}
  scenario "Products", :js => true do
    home.visit_homepage
    expect(page).to have_content("Products")
  end
end