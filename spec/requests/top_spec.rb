require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/top" do
  before(:each) do
    @response = request("/top")
  end
end