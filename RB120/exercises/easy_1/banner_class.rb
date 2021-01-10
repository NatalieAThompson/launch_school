# Behold this incomplete class for constructing boxed banners.

class Banner
  attr_reader :size, :message
  def initialize(message)
    @size = message.length + 3
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+".ljust(size, "-") + "+"
  end

  def empty_line
    "|".ljust(size) + "|"
  end

  def message_line
    "| #{@message} |"
  end
end
# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. 
# However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+