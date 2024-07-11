require 'rails_helper'

RSpec.describe "careers/edit", type: :view do
  let(:career) {
    Career.create!(
      name: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:career, career)
  end

  it "renders the edit career form" do
    render

    assert_select "form[action=?][method=?]", career_path(career), "post" do

      assert_select "input[name=?]", "career[name]"

      assert_select "input[name=?]", "career[description]"
    end
  end
end
