class LinkedList
    @list = []

    def initialize; end
    
    class Node
        attr_accessor :value 
        attr_accessor :next_node

        def initialize(value=nil, next_node=nil)
            @value = value
            @next_node = next_node
        end       
    end

    def node_name(node)
        a = node.inspect.split(" ")
        a[0][14..]
    end
   

    # adds a new node containing value to the end of the list
    def append(value) 
        node = Node.new(value)        
        if(@list == nil)
            @list = [node]  
        else
            @list.push(node) 
            name = node_name(@list[-1])
            @list[-2].next_node = name
        end               
    end

    # adds a new node containing value to the start of the list
    def prepend(value)  
        node = Node.new(value,node_name(@list[0]))              
        if(@list == nil)
            @list = [Node.new(value)]  
        else
            @list.unshift(node)            
        end   
    end

    def size
        @list.size
    end

    def head
        @list[0]
    end

    def tail
        @list[-1]
    end

    def at(index)
        @list[index]
    end

    # removes the last element from the list
    def pop
        if(@list.nil?)
            puts "Linked List is empty!"
            return
        else
            @list.pop
            @list[-1].next_node = nil
        end        
    end

    def contains?(value)
        @list.any? {|x| x.value == value}
    end

    def find(value)  
             
        @list.each_with_index do |node,i|
            if node.value == value
                return i            
            end
        end
        return nil
    end

    def to_s 
        if @list == nil
            puts "nil"
        end
        
        @list.each do |node| 
            print "( #{node.value} ) -> "
            if (node.next_node == nil)
                print "nil\n"
            end
        end
    end
end