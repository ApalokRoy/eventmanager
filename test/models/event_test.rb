require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
    @event = Event.new(name: "Example")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "name should be present" do
    @event.name = "     "
    assert_not @event.valid?
  end

  test "name should not be too long" do
    @event.name = "a" * 21
    assert_not @event.valid?
  end

  test "name should be unique" do
    duplicate_event = @event.dup
    duplicate_event.name = @event.name.upcase
    @event.save
    assert_not duplicate_event.valid?
  end
end
