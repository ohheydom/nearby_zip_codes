require 'sequel'
require_relative '../angular_distance_converter'

module NearbyZipCodes
  class DatabaseReader
    attr_reader :distance_converter, :db

    def initialize(args = {})
      database = args[:database] || File.join(File.dirname(__FILE__), "..", "..", "..", 'data', 'zip_codes.sqlite3')
      adapter = args[:adapter] || 'sqlite'
      @distance_converter = args[:distance_converter] || NearbyZipCodes::AngularDistanceConverter
      @db ||= Sequel.connect(adapter: adapter, database: database)
    end

    def method_missing(meth, zip, &block)
      if db['SELECT * FROM ZipCodes'].columns.include?(meth)
        row = db.fetch("SELECT * FROM ZipCodes WHERE zip_code = '#{zip}';")
        row.empty? ? 'Invalid Zip Code' : row.first[meth]
      else
        'Not a valid header'
      end
    end

    def zip_codes_within_miles_of(zip_code, miles)
      distances = distance_converter.new(longitude: longitude(zip_code), latitude: latitude(zip_code), distance: miles)
      results_within_range_of(distances).map { |result| result[:zip_code] }
    end

    def cities_within_miles_of(zip_code, miles)
      distances = distance_converter.new(longitude: longitude(zip_code), latitude: latitude(zip_code), distance: miles)
      results_within_range_of(distances).map { |result| result[:city] }.uniq
    end

    private

    def results_within_range_of(distances)
      lat_long_string = "(latitude BETWEEN '?' AND '?') AND (longitude BETWEEN '?' AND '?')"
      select_string = "SELECT * FROM ZipCodes WHERE #{lat_long_string};"
      db.fetch(select_string, *distances.latitude_range, *distances.longitude_range.reverse)
    end
  end
end
