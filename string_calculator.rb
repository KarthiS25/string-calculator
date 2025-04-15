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

    number_strings = numbers.split(/#{default_delimiters}/).map(&:strip)
    number_strings.map(&:to_i).sum
  end
end
