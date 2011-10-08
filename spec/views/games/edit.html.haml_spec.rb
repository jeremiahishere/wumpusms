require 'spec_helper'

describe "games/edit.html.haml" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :name => "MyString"
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path(@game), :method => "post" do
      assert_select "input#game_name", :name => "game[name]"
    end
  end
end
