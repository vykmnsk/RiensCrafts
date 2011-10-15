require 'spec_helper'

describe Label do

  before(:each) do
    @test_data = { 
      :name => "testLabel",
      :group_id => 1,
    }
  end

  it "should require Group" do
  	@test_data[:group_id] = nil
    Label.new(@test_data).should_not be_valid
  end

  it "should have existing name" do
  	@test_data[:name] = nil
    Label.new(@test_data).should_not be_valid
  end

  it "should have non-empty name" do
  	@test_data[:name] = ""
    Label.new(@test_data).should_not be_valid
  end

  it "should have big enough name" do
  	@test_data[:name] = "1"
    Label.new(@test_data).should_not be_valid

  	@test_data[:name] = "12"
    Label.new(@test_data).should_not be_valid
  end

end
