require 'spec_helper'

describe "room_connections/index.html.haml" do
  before(:each) do
    assign(:room_connections, [
      stub_model(RoomConnection,
        :start_room_id => 1,
        :end_room_id => 1
      ),
      stub_model(RoomConnection,
        :start_room_id => 1,
        :end_room_id => 1
      )
    ])
  end

  it "renders a list of room_connections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
