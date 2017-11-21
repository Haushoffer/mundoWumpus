When (/^lleno el campo "(.*)" con "(.*)"$/) do |field, value|
  fill_in(field, :with => value)
end