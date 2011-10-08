require 'spec_helper'

describe "rooms/new.html.haml" do
  before(:each) do
    assign(:room, stub_model(Room,
      :game_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path, :method => "post" do
      assert_select "input#room_game_id", :name => "room[game_id]"
      assert_select "input#room_name", :name => "room[name]"
    end
  end
end
