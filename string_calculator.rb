class StringCalculator
  def self.add(numbers)
    raise "Only single string argument is allowed." unless numbers.is_a?(String)
  end
end