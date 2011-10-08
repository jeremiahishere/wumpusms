require 'spec_helper'

describe "room_connections/new.html.haml" do
  before(:each) do
    assign(:room_connection, stub_model(RoomConnection,
      :start_room_id => 1,
      :end_room_id => 1
    ).as_new_record)
  end

  it "renders new room_connection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_connections_path, :method => "post" do
      assert_select "input#room_connection_start_room_id", :name => "room_connection[start_room_id]"
      assert_select "input#room_connection_end_room_id", :name => "room_connection[end_room_id]"
    end
  end
end
