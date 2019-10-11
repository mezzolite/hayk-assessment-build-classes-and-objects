require 'pry'

class Building
    attr_accessor :name, :number_of_tenants
    attr_reader :address

    @@all = []

    def initialize(name, address, number_of_floors, number_of_tenants)
        @name = name
        @address = address
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants
        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_tenants_per_building
        total = all.reduce(0) do |sum, building|
            sum + building.number_of_tenants
        end
        total.to_f / all.length
    end

    def placard
        "#{@name}, #{@address}"
    end

    def average_tenants_per_floor
        number_of_tenants.to_f / @number_of_floors
    end



end

building1 = Building.new('The Grotto', '123 Street, Detroit, MI', 5, 50)
building2 = Building.new('The Embassy', '85 Fulton St, Denver, CO', 2, 3)
building3 = Building.new('Casa Battlo', 'Passeig de Gràcia, 43, 08007 Barcelona, Spain', 7, 104)

building1.average_tenants_per_floor

building_average = Building.average_tenants_per_building

building2.placard

binding.pry
0