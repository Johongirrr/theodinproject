class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_to = node
      @tail = node
    end
  end

  def to_s
    pn = @head
    return 'nil' if pn.nil?
    s = "( #{pn.value} ) -> "
    while pn.next_to != nil
      pn = pn.next_to
      s += "( #{pn.value} ) -> "
    end
    s += "nil"
  end
  
  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_to = @head
      @head = node
    end    
  end

  def size
    pn = @head
    return 0 if pn.nil?
    counter = 1
    while pn.next_to != nil
      counter += 1
      pn = pn.next_to
    end
    counter
  end

  def head
    @head
  end
  def tail
    @tail
  end

  def at(index)
    pn = @head
    return nil if pn.nil? 
    counter = 0
    while pn.next_to != nil
      if counter == index
        return pn
      end
      pn = pn.next_to
      counter +=1
    end
  end

  def pop
    pn = @head
    return nil if pn.nil?
    previous = pn
    while pn.next_to != nil
      previous = pn
      pn = pn.next_to
    end
    @tail = previous
    @tail.next_to = nil
  end
  
  def contains?(value)
    pn = @head
    return false if pn.nil?
    while pn != nil
      return true if pn.value == value
      pn = pn.next_to
    end
    false
  end

  def find(data)
    pn = @head
    return nil if pn.nil?
    index = 0
    while pn != nil
      return index if pn.value == data
      pn = pn.next_to
      index += 1
    end
  end

  def insert_at(index)
    current = self.at(index)
    return nil if current.nil?

    previous = self.at(index-1)
    if previous.nil?
      self.prepend(Node.new)      
    end
    if current != nil && previous != nil
      node = Node.new
      previous.next_to = node
      node.next_to = current 
    end
  end

  def remove_at(index)
    current = self.at(index)
    return nil if current.nil?

    previous = self.at(index-1)
    if previous.nil?
      @head = current.next_to
    else
      previous.next_to = current.next_to
    end
    current.next_to = nil
  end
end