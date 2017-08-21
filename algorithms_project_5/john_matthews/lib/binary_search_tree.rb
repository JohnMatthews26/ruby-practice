# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"
require 'byebug'
class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value, parent = @root)

    if @root.nil?
      @root = BSTNode.new(value)
    elsif value < parent.value
      if parent.left == nil
        parent.left = BSTNode.new(value)
      else
        insert(value, parent.left)
      end
    else
      if parent.right == nil
        parent.right = BSTNode.new(value)
      else
        insert(value, parent.right)
      end
    end

  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
    if value < tree_node.value
      find(value, tree_node.left)
    elsif value > tree_node.value
      find(value, tree_node.right)
    end

  end

  def delete(value)

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:


end
