# frozen_string_literal: true

require 'pry'
class StringCalculator
  DEFAULT_DELIMITER = ','

  def self.add(numbers)
    raise 'Only single string argument is allowed.' unless numbers.is_a?(String)

    return 0 if numbers.empty?

    delimiter = detect_delimiter(numbers)
    numbers = numbers.gsub(%r{//.*\n}, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)
    elements_arr = numbers.split(Regexp.new(delimiter))
    return 'Invalid input' unless elements_arr.all? { |element| valid?(element) }

    numbers_arr = elements_arr.map(&:to_i)
    numbers_arr.each do |num|
      raise "Negative numbers not allowed: #{negative_numbers(numbers_arr)}" if num.negative?
    end
    numbers_arr.sum
  end

  # ensures that there is only positive or negative numbers
  # so if any extra new line chars are there then it will detect it
  def self.valid?(string)
    !string.scan(/^[-+]?\d*\.?\d+$/).empty?
  end

  # find the delimiter passed in the beginning
  # or else use the default delimiter
  def self.detect_delimiter(numbers)
    numbers.start_with?('//') ? numbers[2] : DEFAULT_DELIMITER
  end

  def self.negative_numbers(numbers)
    numbers.select(&:negative?).join(',')
  end
end
