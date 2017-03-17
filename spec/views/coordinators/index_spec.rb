require 'rails_helper'

RSpec.describe 'coordinators/index', type: :view do
  before(:each) do
    @coordinator = create(:coordinator, phone_number: '(999) 999-9999')
    assign(:coordinators, [@coordinator])
  end

  it 'renders a list of coordinators' do
    render
    expect(rendered).to match(@coordinator.name)
    expect(rendered).to match(@coordinator.date_of_birth.strftime('%Y-%m-%d'))
    expect(rendered).to match(/\(999\) 999-9999/)
    expect(rendered).to match(@coordinator.email)
  end
end
