require 'rails_helper'

RSpec.describe 'affiliate_events/edit', type: :view do
  before(:each) do
    tutor = assign(:tutor, create(:tutor))
    @affiliate_event =
      assign(:affiliate_event, create(:affiliate_event, tutor_id: tutor.id))
  end

  it 'renders the edit affiliate_event form' do
    render

    assert_select 'form[action=?][method=?]',
                  affiliate_event_path(@affiliate_event),
                  'post' do
    end
  end
end
