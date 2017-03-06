require 'rails_helper'

RSpec.describe "affiliate_events/edit", type: :view do
  before(:each) do
    @affiliate_event = assign(:affiliate_event, AffiliateEvent.create!())
  end

  it "renders the edit affiliate_event form" do
    render

    assert_select "form[action=?][method=?]", affiliate_event_path(@affiliate_event), "post" do
    end
  end
end
