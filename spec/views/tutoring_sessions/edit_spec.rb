require 'rails_helper'

RSpec.xdescribe 'tutoring_sessions/edit', type: :view do
  before(:each) do
    @tutoring_session = create(:tutoring_sessions)
  end

  it 'renders the edit tutoring_sessions form' do
    render

    expect(rendered).to match(@tutoring_session.location)
    expect(rendered).to match(@tutoring_session.start_time)
    expect(rendered).to match(@tutoring_session.end_time)
  end
end
