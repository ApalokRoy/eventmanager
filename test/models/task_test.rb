require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @task = Task.new(name: "planning", event_id: 1, schedule_date: "2016-10-15", schedule_time: "14:30:00")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "name should be present" do
    @task.name = "     "
    assert_not @task.valid?
  end

  test "name should not be too long" do
    @task.name = "a" * 21
    assert_not @task.valid?
  end
end
