require "calculator/version"

module Calculator

  class StringCalculator
    def self.add(numbers)
      # Return 0 if the input string is empty
      return 0 if numbers.empty?
      
      # Define a default delimiter pattern to split the numbers, which includes comma and newline
      delimiter = /,|\n/
      
      # Check if the string starts with a custom delimiter specification
      if numbers.start_with?("//")
        # Extract the custom delimiter and the rest of the numbers string
        delimiter_spec, numbers = numbers.split("\n", 2)
        # Update the delimiter pattern to use the custom delimiter, escaping any special characters
        delimiter = Regexp.escape(delimiter_spec[2..-1])
      end

      # Split the numbers string using the delimiter pattern and convert each number to an integer
      number_list = numbers.split(/#{delimiter}/).map(&:to_i)
      
      # Select any negative numbers from the list
      negative_numbers = number_list.select { |n| n < 0 }
      # Raise an error if there are any negative numbers, including them in the error message
      unless negative_numbers.empty?
        raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
      end

      # Calculate and return the sum of the numbers
      number_list.sum
    end
  end

end