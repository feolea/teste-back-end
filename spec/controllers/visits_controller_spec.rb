# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitsController do
  describe 'POST create' do
    context 'with valid params' do
      it 'returns 202' do
        params = {
          visit: {
            guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75',
            url: 'somecoolsite.io/path',
            timestamp: Time.now.to_i
          }
        }

        post :create, params: params

        expect(response).to have_http_status(:accepted)
      end

      it 'enqueues an VisitsPersistJob' do
        ActiveJob::Base.queue_adapter = :test
        params = {
          visit: {
            guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75',
            url: 'somecoolsite.io/path/now',
            timestamp: Time.now.to_i
          }
        }

        post :create, params: params

        expect(VisitsPersistJob)
          .to have_been_enqueued
          .with(params[:visit].as_json)
      end
    end

    context 'with invalid params' do
      it 'returns 400' do
        params = { bla: 3 }

        post :create, params: params

        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET report' do
    context 'without params' do
      it 'returns up to 50 last visits' do
        51.times { FactoryBot.create(:visit) }

        get :report, params: {}

        expect(response).to have_http_status(:success)
        expect(assigns[:visits].to_a.count).to eq(50)
      end

      it 'returns all visits if less then 50' do
        49.times { FactoryBot.create(:visit) }

        get :report, params: {}

        expect(assigns[:visits].to_a.count).to eq 49
      end

      it 'order by timestamp descendant' do
        FactoryBot.create(:visit, timestamp: 1)
        FactoryBot.create(:visit, timestamp: 5)
        FactoryBot.create(:visit, timestamp: 3)

        get :report, params: {}

        expect(assigns[:visits].to_a.map(&:timestamp)).to eq([5, 3, 1])
      end
    end

    context 'with limit params' do
      it 'returns the limit provided' do
        50.times { FactoryBot.create(:visit) }

        get :report, params: { limit: 48 }

        expect(assigns[:visits].to_a.count).to eq(48)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
