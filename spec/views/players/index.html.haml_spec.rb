require 'spec_helper'

describe "players/index.html.haml" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :game_id => 1,
        :user_id => 1,
        :room_id => 1,
        :status => "Status"
      ),
      stub_model(Player,
        :game_id => 1,
        :user_id => 1,
        :room_id => 1,
        :status => "Status"
      )
    ])
  end

  it "renders a list of players" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
