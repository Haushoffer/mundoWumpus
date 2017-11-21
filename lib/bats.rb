require './lib/bat.rb'
require './lib/cavern.rb'
class Bats
    def initialize(gameCavern)
        $cavern = gameCavern
        $n = gameCavern.getBatNumber
        $bats = []
        $n.times do |i|
            $bats[i] = Bat.new($cavern.getRandomCave)
        end
    end
end