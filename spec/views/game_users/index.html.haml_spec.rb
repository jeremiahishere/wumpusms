require 'spec_helper'

describe "game_users/index.html.haml" do
  before(:each) do
    assign(:game_users, [
      stub_model(GameUser,
        :game_id => 1,
        :user_id => 1
      ),
      stub_model(GameUser,
        :game_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of game_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
