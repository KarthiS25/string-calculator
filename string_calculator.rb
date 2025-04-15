class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    default_delimiters = /,|\n/ # Default delimiter

    # Custom delimiter
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      default_delimiters = Regexp.escape(custom_delimiter)
    end

    number_strings = numbers.split(/#{default_delimiters}/).map(&:strip) # Split the numbers by the delimiters
    number_strings.reject!(&:empty?) # Remove empty strings
    negative_numbers = number_strings.map(&:to_i).select { |n| n < 0 } # Check the negative numbers

    unless negative_numbers.empty?
      raise "negative numbers not allowed #{negative_numbers.join(',')}"
    end

    number_strings.map(&:to_i).sum
  end
end
