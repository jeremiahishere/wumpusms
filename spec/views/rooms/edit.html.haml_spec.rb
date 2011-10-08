require 'spec_helper'

describe "rooms/edit.html.haml" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :game_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path(@room), :method => "post" do
      assert_select "input#room_game_id", :name => "room[game_id]"
      assert_select "input#room_name", :name => "room[name]"
    end
  end
end
