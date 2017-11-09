Then(/^deberia mostrar el boton "(.*)"$/) do |nombreBoton|
  last_response.body.should =~ /#{nombreBoton}/m
end
