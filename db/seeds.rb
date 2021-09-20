# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Airports

Airport::destroy_all

Airport.create(id: 1, name: 'Frankfurt', code: 'FRA')
Airport.create(id: 2, name: 'Heathrow', code: 'LHR')
Airport.create(id: 3, name: 'Gatwick', code: 'LGW')
Airport.create(id: 4, name: 'Nice', code: 'NCE')
Airport.create(id: 5, name: 'Belfast', code: 'BFS')
Airport.create(id: 6, name: 'Dublin', code: 'DUB')


# Flights

Flight::destroy_all

Flight.create!(id: 1, from_airport_id: 1, to_airport_id: 2, depart_date: '20210814132000', duration: '120', airline_id: 1)
Flight.create!(id: 2, from_airport_id: 1, to_airport_id: 3, depart_date: '20210819090000', duration: '60', airline_id: 2)
Flight.create!(id: 3, from_airport_id: 1, to_airport_id: 2, depart_date: '20210921123000', duration: '120', airline_id: 3)
Flight.create!(id: 4, from_airport_id: 6, to_airport_id: 4, depart_date: '20210923190000', duration: '140', airline_id: 3)
Flight.create!(id: 5, from_airport_id: 6, to_airport_id: 1, depart_date: '20211102160000', duration: '90', airline_id: 1)
Flight.create!(id: 6, from_airport_id: 1, to_airport_id: 2, depart_date: '20211006144000', duration: '120', airline_id: 2)
Flight.create!(id: 7, from_airport_id: 1, to_airport_id: 2, depart_date: '20210912085000', duration: '120', airline_id: 3)



# Airlines

Airline::delete_all

Airline.create!(id: 1, name: 'Ryanair', code: 'RYR')
Airline.create!(id: 2, name: 'Easyjet', code: 'EZY')
Airline.create!(id: 3, name: 'Air France', code: 'AF')
Airline.create!(id: 4, name: 'British Airways', code: 'BA')


# Passengers

Passenger::delete_all

Passenger.create!(id: 1, first_name: 'Bob', family_name: 'Smith', email: 'bob@gmail.com')
Passenger.create!(id: 2, first_name: 'Harold', family_name: 'Jones', email: 'harold@gmail.com')
Passenger.create!(id: 3, first_name: 'Mick', family_name: 'Feeney', email: 'mick@gmail.com')



# Bookings

Booking::delete_all

Booking.create!(flight_id: 1, passenger_id: 1)



puts "data loaded success"