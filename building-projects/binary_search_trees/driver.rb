require_relative 'tree'

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
# 2. Confirm that the tree is balanced by calling `#balanced?`
# 3. Print out all elements in level, pre, post, and in order
# 4. try to unbalance the tree by adding several numbers > 100
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
# 6. Balance the tree by calling `#rebalance!`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order

values = Array.new(15) { rand(1..100) }
tree = Tree.new(values)
puts "The tree is balanced? : #{tree.balanced?}"
puts "Level Order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Inorder: #{tree.inorder}"
puts "Postorder: #{tree.postorder}"
puts "Adding random values to unbalance the tree..."
tree.insert(120)
tree.insert(150)
tree.insert(110)
tree.insert(105)
puts "The tree is balanced? : #{tree.balanced?}"
puts "Blanacing..."
tree.rebalance!
puts "The tree is balanced? : #{tree.balanced?}"
puts "Level Order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Inorder: #{tree.inorder}"
puts "Postorder: #{tree.postorder}"