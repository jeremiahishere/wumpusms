require 'spec_helper'

describe "game_users/show.html.haml" do
  before(:each) do
    @game_user = assign(:game_user, stub_model(GameUser,
      :game_id => 1,
      :user_id => 1
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
