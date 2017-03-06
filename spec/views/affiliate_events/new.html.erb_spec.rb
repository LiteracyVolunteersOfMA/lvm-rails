require 'rails_helper'

RSpec.describe "affiliate_events/new", type: :view do
  before(:each) do
    assign(:affiliate_event, AffiliateEvent.new())
  end

  it "renders new affiliate_event form" do
    render

    assert_select "form[action=?][method=?]", affiliate_events_path, "post" do
    end
  end
end
