require 'pry'
class StringCalculator
  def self.add(numbers)
    raise "Only single string argument is allowed." unless numbers.is_a?(String)
    
    return 0 if numbers.length == 0
    delimiter = detect_delimiter(numbers)
    numbers = numbers.gsub(/\/\/.*\n/, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)
    elements_arr = numbers.split(Regexp.new(delimiter))
    return 'Invalid input' unless elements_arr.all?{|element|valid?(element)}
    elements_arr.map(&:to_i).sum
  end

  def self.valid?(string)
    !string.scan(/^[-+]?\d*\.?\d+$/).empty?
  end

  def self.detect_delimiter(numbers)
    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
    end
    delimiter
  end
end
