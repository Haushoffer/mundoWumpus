Then(/^deberia mostrar la cantidad de "(.*)"$/) do |cantidadFlechas|
  response.should have_content =~ /#{cantidadFlechas}/m
end