# frozen_string_literal: true

require 'rails_helper'

#
# Products controller requests
#
RSpec.describe 'Products controller specs', type: :request do
  #
  # Seeds products data
  #
  before(:each) do
    request_body = {
      id: 1,
      name: 'Dressing Gown',
      category: 'Full Body Outfits',
      retail_price: 303.0,
      discounted_price: 251.49,
      availability: true
    }
    post('/products', params: request_body, as: :json)
    expect(response.status).to eq(201)
  end

  #
  # It tests creating products
  #
  it 'tests - create product' do
    #
    # Create product with id 1
    #
    request_body = {
      id: 2,
      name: 'Dressing Gown',
      category: 'Full Body Outfits',
      retail_price: 303.0,
      discounted_price: 251.49,
      availability: true
    }
    post('/products', params: request_body, as: :json)
    expect(response.status).to eq(201)

    #
    # Create product with id 2
    #
    request_body = {
      id: 3,
      name: 'Shoes',
      category: 'Footwear',
      retail_price: 150.0,
      discounted_price: 123.0,
      availability: true
    }
    post('/products', params: request_body, as: :json)
    expect(response.status).to eq(201)
  end

  #
  # It tests creating existing products
  #
  it 'tests - create product with existing id' do
    #
    # Create product with existing id 1
    #
    request_body = {
      id: 1,
      name: 'Dressing Gown',
      category: 'Underwear',
      retail_price: 303.0,
      discounted_price: 251.49,
      availability: true
    }
    post('/products', params: request_body, as: :json)
    expect(response.status).to eq(400)
  end

  #
  # It tests if discounted price is less than or equal to retain price
  #
  request_body = {
    id: 4,
    name: 'Dressing Gown',
    category: 'Underwear',
    retail_price: 303.0,
    discounted_price: 551.49,
    availability: true
  }
  post('/products', params: request_body, as: :json)
  expect(response.status).to eq(400)
end
