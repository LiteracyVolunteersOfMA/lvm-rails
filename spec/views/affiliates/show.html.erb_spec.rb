require 'rails_helper'

RSpec.describe "affiliates/show", type: :view do
  before(:each) do
    @affiliate = assign(:affiliate, Affiliate.create!(
      :name => "Name",
      :address => "Address",
      :phone_number => "Phone Number",
      :email => "Email",
      :website => "Website",
      :twitter => "Twitter"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Twitter/)
  end
end
