require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  
  def setup
    @expense = Expense.new(name: "Design", task_id: 1, cost: 10000)
  end

  test "should be valid" do
    assert @expense.valid?
  end

  test "name should be present" do
    @expense.name = "     "
    assert_not @expense.valid?
  end

  test "name should not be too long" do
    @expense.name = "a" * 21
    assert_not @expense.valid?
  end
end
