require 'rails_helper'

RSpec.describe "affiliates/index", type: :view do
  before(:each) do
    assign(:affiliates, [
      Affiliate.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :email => "Email",
        :website => "Website",
        :twitter => "Twitter"
      ),
      Affiliate.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => "Phone Number",
        :email => "Email",
        :website => "Website",
        :twitter => "Twitter"
      )
    ])
  end

  it "renders a list of affiliates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
  end
end
