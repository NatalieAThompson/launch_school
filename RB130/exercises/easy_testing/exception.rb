# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

class NoExperienceError < StandardError; end

class Employee
  def hire
    # raise NoExperienceError
  end
end

require "minitest/autorun"

class IncludeTest < MiniTest::Test
  def test_value
    assert_raises(NoExperienceError) do
      employee = Employee.new
      employee.hire
    end
  end
end