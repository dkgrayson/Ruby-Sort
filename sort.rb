USAGE_MSG = 'Usage: ruby sort.rb filename'

return STDOUT.write USAGE_MSG if ARGV[0].nil?

lease_data = []
begin File.open(ARGV[0]).each do |line|
    lease_data.push line
  end
rescue Exception => e
  raise StandardError, USAGE_MSG
end

sorted_lease_data = lease_data.sort_by { |lease| lease[/\#(.*?)\s/,1]}

sorted_lease_data.each do |data|
  STDOUT.write data
end
