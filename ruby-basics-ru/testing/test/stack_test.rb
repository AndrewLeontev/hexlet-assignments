# frozen_string_literal: true
require 'minitest/autorun'

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new([1, 2, 3])
  end

  # добавления элемента
  def test_push_item_to_stack
    @stack.push!(4)
    assert_includes(@stack.to_a, 4)
  end

  # удаления элемента
  def test_delete_item_from_stack
    @stack.pop!
    assert(@stack.size == 2)
    assert(@stack.to_a.last == 2)
  end

  # очистки стека
  def test_stack_must_be_clear
    @stack.clear!
    assert(@stack.size == 0)
    refute_includes(@stack.to_a, 1)
  end

  # проверки стека на пустоту
  def test_stack_must_be_empty
    @stack.clear!
    assert_empty(@stack)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
