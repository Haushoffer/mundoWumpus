Given("visito la pagina de inicio") do
  visit('/')
end

Then(/^deberia mostrar el mensaje "(.*)"$/) do |mensajeInicial|
  last_response.body.should =~ /#{mensajeInicial}/m
end

When (/^pulso el boton "(.*)"$/) do |boton|
  click_button(boton)
end