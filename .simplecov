
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::HTMLFormatter,
                                                                 SimpleCov::Formatter::SimpleFormatter
                                                               ])
SimpleCov.start 'rails' do
  # any custom configs like groups and filters can be here at a central place
  add_filter 'vendor'
  add_filter 'app/channels/'
  enable_coverage :branch
end

SimpleCov.at_exit do
  puts SimpleCov.result.format!
end