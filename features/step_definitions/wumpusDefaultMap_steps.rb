Given("visito la pagina de inicio") do
  visit('/')
end

Then(/^deberia mostrar el mensaje "(.*)"$/) do |mensajeInicial|
  response.should have_content =~ /#{mensajeInicial}/m
end

When (/^pulso el boton "(.*)"$/) do |boton|
  click_button(boton)
end
When (/^pulso el boton de direccion "(.*)"$/) do |boton|
  click_button(boton)
  follow_redirect!
end