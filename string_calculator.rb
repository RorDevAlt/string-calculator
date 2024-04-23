class StringCalculator
  def self.add(numbers)
    raise "Only single string argument is allowed." unless numbers.is_a?(String)

    return 0 if numbers.length == 0
    numbers = numbers.gsub(/\n/, ',')
    numbers.split(',').map(&:to_i).sum
  end
end