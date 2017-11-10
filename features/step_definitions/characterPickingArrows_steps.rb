Then(/^deberia mostrar la cantidad de flechas igual a "(.*)"$/) do |cantidadFlechas|
  response.should have_content =~ /#{cantidadFlechas}/m
end