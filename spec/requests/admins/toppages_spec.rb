# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admins::Toppages', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admins/toppages/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/admins/toppages/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/admins/toppages/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/admins/toppages/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/admins/toppages/destroy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/admins/toppages/create'
      expect(response).to have_http_status(:success)
    end
  end
end
