# LRU(Least Recently Used) Cache

1. **get(key)** - Get the value (will always be positve) of the key exists in the catheterizations, otherwise return -1.
2. **put(key, value)**- Set or insert the value if the key is not already present. When the cache reached its capacity, it should remove the least recently used item before inserting a new item.

##Put flow chart

![put flow](/Users/calvinchu/Vagrant/vagrant-rvm-box/work/interview/lru-cache/pics/put-flow.png)

## Example

####Capacity 4 example:

![capacity 4 example](/Users/calvinchu/Vagrant/vagrant-rvm-box/work/interview/lru-cache/pics/cap-4-example.png)

####Capacity 2 example:



```ruby
cache = LRUcache(2).new  #2 is capacity

cache.put(1, "x")
cache.put(2, "y")
cache.get(1)          #returns "x"
cache.put(3, "z")     #evicts key 2
cache.get(2)          #returns -1 (not found)
cache.put(4, "b")     #evicts key 1
cache.get(1)          #returns -1 (not found)
cache.get(3)          #returns z
cache.get(4)          #returns b

```



You can just paste the code here and excute to see the result.

https://www.codechef.com/ide