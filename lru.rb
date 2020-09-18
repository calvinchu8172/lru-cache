class LRUCache
  attr_accessor :capacity

  def initialize(capacity)
    @arr = []
    @capacity = capacity
    @seq = 0
  end

  def put(key, value)
    if @arr.size < @capacity
      add_new(key, value)
    elsif key_exist?(key)
      replace_current(key, value)
    else
      replace_oldest(key, value)
    end
  end

  def get(key)
    result = find_key(key)
    if result.empty?
      -1
    else
      result[0][:seq] = add_seq
      result[0][:value]
    end
  end

  def show
    @arr
  end

  private

  def add_seq
    @seq += 1
  end

  def find_key(key)
    result = @arr.select do |a|
      a[:key] == key
    end
  end

  def find_seq(seq)
    result = @arr.select do |a|
      a[:seq] == seq
    end
  end

  def key_exist?(key)
    if find_key(key).empty?
      false
    else
      true
    end
  end

  def add_new(key, value)
    h = { seq: add_seq, key: key, value: value }
    @arr << h
  end

  def replace_current(key, value)
    result = find_key(key)
    result[0][:seq] = add_seq
    result[0][:value] = value
  end

  def replace_oldest(key, value)

    seq_arr = @arr.map do |i|
      i[:seq]
    end
    result = find_seq(seq_arr.min)
    result[0][:seq] = add_seq
    result[0][:key] = key
    result[0][:value] = value

  end

end

# If the capacity is 2
cache = LRUCache.new 2
cache.put 1, "x"
cache.put 2, "y"
p cache.get 1
cache.put 3, "z"
p cache.get 2
cache.put 4, "b"
p cache.get 1
p cache.get 3
p cache.get 4

# If the capacity is 4
cache = LRUCache.new 4
cache.put 'a', 0
cache.put 'b', 1
cache.put 'c', 2
cache.put 'd', 3
cache.put 'e', 4
cache.put 'd', 5
cache.put 'f', 6
p cache.show