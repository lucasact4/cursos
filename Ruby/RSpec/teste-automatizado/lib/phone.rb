require 'pry'

class Phone
  def initialize(number)
    @number = number
  end
  def valid_number?
    # return false if @number.empty?

    # binding.pry
    @number.match?(/\A[\d\s]+\z/)
  end
end