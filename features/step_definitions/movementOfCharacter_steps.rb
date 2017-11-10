Then(/^deberia mostrar el boton "(.*)"$/) do |nombreBoton|
  response.should have_content =~ /#{nombreBoton}/m
end
