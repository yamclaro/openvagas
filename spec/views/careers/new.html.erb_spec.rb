require 'rails_helper'

RSpec.describe "careers/new", type: :view do
  before(:each) do
    assign(:career, Career.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new career form" do
    render

    assert_select "form[action=?][method=?]", careers_path, "post" do
      assert_select "input[name=?]", "career[name]"

      assert_select "input[name=?]", "career[description]"
    end
  end
end
