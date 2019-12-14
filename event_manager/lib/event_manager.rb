require 'erb'
require 'csv'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4] 
end

def clean_phone_number(phone)
  phone.to_s.gsub!(/\D/, '')
  length = phone.length
  bad_number = (length == 11 && phone[0] != '1') || length > 11 || length < 10
  if bad_number
    return 'bad number'
  end
  if length == 11 &&  phone[0] == '1'
    return phone[1..] 
  end
  return phone
end

def clean_register_date(date)
  begin
    DateTime.strptime(date, '%y/%d/%m %k:%M')
  rescue
    'invalid'
  end
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exists? 'output'
  filename = "output/thanks_#{id}.html"
  File.open(filename, 'w') do |file|
    file.puts form_letter 
  end
end

rows = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"

erb_template = ERB.new template_letter
reg_dates = []
hours = []

rows.each do |row|
  name = row[:first_name]
  id = row[0]
  date = clean_register_date(row[:regdate])

  reg_dates.push(date)
  hours.push(date.hour)

  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_number(row[:homephone])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)
end
puts "which hours of the day the most people registered?"
max = 0
hour_counts = hours.group_by(&:itself).transform_values(&:count).to_a
hour_counts.each do |item|
  max = item[1] > max ? item[1] : max
end
hours = hour_counts.select {|item| item[1] == max}
hs = hours.map{|item| item[0]}
hs = reg_dates.select{|d| hs.include?(d.hour)}
hs.each {|d| puts "#{d.hour}:#{d.minute} with #{max} registers"} 