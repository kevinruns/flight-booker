# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DURATIONS = {
  'FRA' => {
    'LHR' => 80,
    'LGW' => 75,
    'NCE' => 60,
    'BFS' => 105,
    'DUB' => 90
  },
  'LHR' => {
    'LGW' => 75,
    'NCE' => 60,
    'BFS' => 105,
    'DUB' => 90
  },
  'LGW' => {
    'NCE' => 60,
    'BFS' => 105,
    'DUB' => 90
  },
  'NCE' => {
    'BFS' => 105,
    'DUB' => 90
  },
  'BFS' => {
    'DUB' => 82
  },
  'DUB' => {}
}

AIRLINES = {

  'FRA' => {
    'LHR' => 'RYR',
    'LGW' => 'EZY',
    'NCE' => 'RYR',
    'BFS' => 'AF',
    'DUB' => 'RYR'
  },
  'LHR' => {
    'LGW' => 'RYR',
    'NCE' => 'AF',
    'BFS' => 'RYR',
    'DUB' => 'AF'
  },
  'LGW' => {
    'NCE' => 'BA',
    'BFS' => 'RYR',
    'DUB' => 'BA'
  },
  'NCE' => {
    'BFS' => 'RYR',
    'DUB' => 'BA'
  },
  'BFS' => {
    'DUB' => 'EZY'
  },
  'DUB' => {}
}


def random_time
  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
end

def get_duration(origin, destination)
  DURATIONS[origin][destination] || DURATIONS[destination][origin]
end

def get_airline_code(origin, destination)
  AIRLINES[origin][destination] || AIRLINES[destination][origin]
end

def get_random_string
  [*('A'..'Z'),*('0'..'9')].shuffle[0, 5].join
end


ActiveRecord::Base.transaction do

  Booking.destroy_all
  Passenger.destroy_all
  Flight.destroy_all
  Airport.destroy_all
  Airline.destroy_all

  ActiveRecord::Base.connection.reset_pk_sequence!('bookings')
  ActiveRecord::Base.connection.reset_pk_sequence!('passengers')
  ActiveRecord::Base.connection.reset_pk_sequence!('flights')
  ActiveRecord::Base.connection.reset_pk_sequence!('airports')
  ActiveRecord::Base.connection.reset_pk_sequence!('airlines')


  # seed airports
  airports = []
  airports[0] = Airport.create(name: 'Frankfurt', code: 'FRA')
  airports[1] = Airport.create(name: 'Heathrow', code: 'LHR')
  airports[2] = Airport.create(name: 'Gatwick', code: 'LGW')
  airports[3] = Airport.create(name: 'Nice', code: 'NCE')
  airports[4] = Airport.create(name: 'Belfast', code: 'BFS')
  airports[5] = Airport.create(name: 'Dublin', code: 'DUB')


  # seed airlines
  airlines = []
  airlines[0] = Airline.create(name: 'Ryanair', code: 'RYR')
  airlines[1] = Airline.create(name: 'Easyjet', code: 'EZY')
  airlines[2] = Airline.create(name: 'Air France', code: 'AF')
  airlines[3] = Airline.create(name: 'British Airways', code: 'BA')


  # seed flights

  Date.new(2021, 11, 1).upto(Date.new(2021, 11, 30)).each do |date|
    airports.each do |origin|
      airports.each do |destination|
        next if origin == destination

        3.times { 

                  airline_code = get_airline_code(origin.code, destination.code)
                  airline_var =  Airline.find_by code: airline_code

                  Flight.create(flight_number: get_random_string,
                                from_airport_id: origin.id, 
                                to_airport_id: destination.id, 
                                depart_date: date, 
                                depart_time: random_time,
                                duration: get_duration(origin.code, destination.code), 
                                airline_id: airline_var.id)
                }
      end
    end
  end

  @passengers = []
  10.times do |i|
    @passengers[i] = Passenger.create(first_name: Faker::Name.first_name, family_name: Faker::Name.last_name, email: Faker::Internet.email)
  end

end



##########################################################################################################################
