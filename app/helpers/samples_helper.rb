module SamplesHelper
  def format_decimal(value, a = 5)
    format("%.#{a}f", value)
  end
end
