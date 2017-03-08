require 'rails_helper'

RSpec.describe AffiliateEventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/affiliate_events').to route_to('affiliate_events#index')
    end

    it 'routes to #new' do
      expect(get: '/affiliate_events/new').to route_to('affiliate_events#new')
    end

    it 'routes to #show' do
      expect(get: '/affiliate_events/1')
        .to route_to('affiliate_events#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/affiliate_events/1/edit')
        .to route_to('affiliate_events#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/affiliate_events').to route_to('affiliate_events#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/affiliate_events/1')
        .to route_to('affiliate_events#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/affiliate_events/1')
        .to route_to('affiliate_events#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/affiliate_events/1')
        .to route_to('affiliate_events#destroy', id: '1')
    end
  end
end
