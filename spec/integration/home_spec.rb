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
    (1..7).each do |n|
      visit('/products/new')
      fill_in('product_name', with: "Product Number #{n}")
      fill_in('product_category', with: "Shoe")
      fill_in('product_retail_price', with: "12.50")
      fill_in('product_discounted_price', with: "10.00")
      click_on('commit')
    end
    visit('/products?start=0&limit=5')
    expect(page).to have_selector('tr', count: 5)
  end
end