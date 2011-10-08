require 'spec_helper'

describe "room_connections/show.html.haml" do
  before(:each) do
    @room_connection = assign(:room_connection, stub_model(RoomConnection,
      :start_room_id => 1,
      :end_room_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
