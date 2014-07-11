require 'nearby_zip_codes/version'
require 'nearby_zip_codes/angular_distance_converter'
Dir[File.join('nearby_zip_codes', 'readers', '*.rb')].each { |file| require_relative file }

module NearbyZipCodes
  class NearbyZipCodes
    attr_reader :zip_code, :long_lat_reader

    def initialize(zip_code, long_lat_reader = DatabaseReader.new)
      @zip_code = format("%05d", zip_code.to_s(radix(zip_code)))
      @long_lat_reader = long_lat_reader
    end

    def longitude
      long_lat_reader.longitude(zip_code)
    end

    def latitude
      long_lat_reader.latitude(zip_code)
    end

    def nearby_zip_codes(miles = 5)
      long_lat_reader.zip_codes_within_miles_of(zip_code, miles)
    end

    def nearby_cities(miles = 5)
      long_lat_reader.cities_within_miles_of(zip_code, miles)
    end

    private

    def radix(int)
      int[0] == 0 ? 8 : 10
    end
  end
end
