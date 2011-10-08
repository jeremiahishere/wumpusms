require 'spec_helper'

describe "messages/new.html.haml" do
  before(:each) do
    assign(:message, stub_model(Message,
      :text => "MyString",
      :user_id => 1,
      :game_id => 1
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_text", :name => "message[text]"
      assert_select "input#message_user_id", :name => "message[user_id]"
      assert_select "input#message_game_id", :name => "message[game_id]"
    end
  end
end
