require_relative './node'
class Tree
  attr_accessor :root
  def initialize(values)
    @values = values
    @root = Tree.build_tree(@values)
  end

  def insert(value)
    pn = @root
    while true
      if pn.data < value
        if pn.right.nil?
          pn.right = Node.new(value)
          break
        else
          pn = pn.right
        end
      elsif pn.data > value
        if pn.left.nil?
          pn.left = Node.new(value)
          break
        else
          pn = pn.left
        end
      else
        break
      end
    end
  end

  def delete(value)
    
    pn = @root
    previous = pn
    if @root.data == value
      @root.right.left = @root.left
      @root = @root.right
      pn.right = nil
      pn.left = nil
      return
    end

    while pn != nil
      if pn.data == value
        if pn.right != nil
          previous.left = pn.right
          pn.right.left = pn.left
        else
          previous.left = pn.left
        end
        break
      elsif value < pn.data
        previous = pn
        pn = pn.left
      else
        previous = pn
        pn = pn.right
      end
    end
  end
  def find(value)
    pn = @root
    while pn != nil
      return pn if pn.data == value
      value < pn.data ? pn = pn.left : pn = pn.right
    end
  end
  def level_order
    pn = @root
    return nil if pn.nil?
    q = []
    result = []
    q.push(pn)
    while not q.empty?
      pn = q.shift()
      if block_given?
        result.push(yield(pn))
      else
        result.push(pn.data)
      end

      q.push(pn.left) if pn.left != nil  
      q.push(pn.right) if pn.right != nil 
    end
    result
  end

  def self.build_tree(arr)
    size = arr.length
    root = Node.new(arr[0])
    pn = root
    i = 1
    while i<size
      if pn.data > arr[i]
        if pn.left.nil?
          pn.left = Node.new(arr[i])
          i+=1
          pn = root
        else
          pn = pn.left
        end
      elsif pn.data < arr[i]
        if pn.right.nil?
          pn.right = Node.new(arr[i])
          i+=1
          pn = root
        else
          pn = pn.right
        end
      else
        i += 1
        pn = root
      end
    end
    root
  end
  def preorder(root = @root, results = [], &block)
    return results if root.nil?
    if block_given?
      results.push(yield(root))
    else    
      results.push(root.data)
    end
    preorder(root.left, results, &block)
    preorder(root.right, results, &block)
  end

  def inorder(root = @root, results = [], &block)
    return results if root.nil?
    inorder(root.left, results, &block)
    if block_given?
      results.push(yield(root))
    else    
      results.push(root.data)
    end
    inorder(root.right, results, &block)
  end

  def postorder(root = @root, results = [], &block)
    return results if root.nil?
    postorder(root.left, results, &block)
    postorder(root.right, results, &block)
    if block_given?
      results.push(yield(root))
    else    
      results.push(root.data)
    end
  end

end
