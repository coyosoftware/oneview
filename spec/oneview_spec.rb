require 'spec_helper'

RSpec.describe Oneview do
  it "returns a new Oneview::Client" do
    expect(Oneview.new("abc").class).to eq(Oneview::Client)
  end
end