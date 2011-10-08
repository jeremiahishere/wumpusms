require 'spec_helper'

describe "messages/show.html.haml" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :text => "Text",
      :user_id => 1,
      :game_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
