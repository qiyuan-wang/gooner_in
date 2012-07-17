require 'spec_helper'

describe "players/edit" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :name => "MyString",
      :e_name => "MyString",
      :nationality => "MyString",
      :day_of_birth => "",
      :position => "MyString"
    ))
  end

  it "renders the edit player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => players_path(@player), :method => "post" do
      assert_select "input#player_name", :name => "player[name]"
      assert_select "input#player_e_name", :name => "player[e_name]"
      assert_select "input#player_nationality", :name => "player[nationality]"
      assert_select "input#player_day_of_birth", :name => "player[day_of_birth]"
      assert_select "input#player_position", :name => "player[position]"
    end
  end
end
