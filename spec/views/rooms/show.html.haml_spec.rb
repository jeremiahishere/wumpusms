require 'spec_helper'

describe "rooms/show.html.haml" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :game_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
