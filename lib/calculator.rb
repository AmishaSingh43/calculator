require "calculator/version"

module Calculator

  class StringCalculator
    def self.add(numbers)
      return 0 if numbers.empty?
      
      delimiter = /,|\n/
      if numbers.start_with?("//")
        delimiter_spec, numbers = numbers.split("\n", 2)
        delimiter = Regexp.escape(delimiter_spec[2..-1])
      end

      number_list = numbers.split(/#{delimiter}/).map(&:to_i)
      
      negative_numbers = number_list.select { |n| n < 0 }
      unless negative_numbers.empty?
        raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
      end

      number_list.sum
    end
  end

end