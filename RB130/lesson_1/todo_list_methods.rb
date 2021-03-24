class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(object)
    raise_type_error(object)
    
    todos << object
  end
  alias_method :<<, :add
  
  def size
    todos.size
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end
  
  def to_a
    todos
  end
  
  def done?
    todos.all? do |todo|
      todo.done?
    end
  end
  
  def item_at(index)
    raise_index_error(index)
    
    todos[index]
  end
  
  def mark_done_at(index)
    raise_index_error(index)
    
    todos[index].done = true
  end
  
  def mark_undone_at(index)
    raise_index_error(index)
    
    todos[index].done = false
  end
  
  def done!
    todos.each do |todo|
      todo.done = true
    end
  end
  
  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end
  
  def remove_at(index)
    raise_index_error(index)
    
    todos.delete_at(index)
  end
  
  def to_s
    puts "---- #{title} ----\n"
    todos.each do |todo|
      puts todo
    end
  end
  
  def each
    counter = 0
    
    loop do
      yield(todos[counter])
      counter += 1
      break if counter >= todos.size  
    end
    
    self
  end
  
  def select
    ar = []
    
    todos.each do |todo|
      ar << todo if yield(todo)
    end
    
    new_list = TodoList.new("New List")
    new_list.todos = ar
    
    new_list
  end
  
  def find_by_title(str)
    new = select do |todo|
      str == todo.title
    end
    
    new.todos.empty? ? nil : todos
  end
  
  def all_done
    select do |todo|
      todo.done?
    end
  end
  
  def all_not_done
    select do |todo|
      !todo.done?
    end
  end
  
  def mark_done(str)
    each do |todo|
      if str == todo.title
        todo.done = true
        break
      end
    end
  end
  
  def mark_all_done
    each do |todo|
      todo.done = true
    end
  end
  
  def mark_all_undone
    each do |todo|
      todo.done = false
    end
  end
  
  protected
  attr_accessor :todos
  
  private 
  
  def raise_type_error(object)
    raise TypeError, "Can only add Todo objects" unless object.instance_of?(Todo)
  end
  
  def raise_index_error(index)
    raise IndexError if index >= todos.length
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

p list.find_by_title("Nothing")
list.mark_all_undone
p list.all_done
p list.all_not_done


# find_by_title  takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
# all_done  returns new TodoList object containing only the done items
# all_not_done  returns new TodoList object containing only the not done items
# mark_done  takes a string as argument, and marks the first Todo object that matches the argument as done.
# mark_all_done  mark every todo as done
# mark_all_undone  mark every todo as not done