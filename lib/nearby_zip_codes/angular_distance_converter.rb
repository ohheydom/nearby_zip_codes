module NearbyZipCodes
  class AngularDistanceConverter
    attr_reader :longitude, :latitude, :distance

    def initialize(args = {})
      @longitude = args[:longitude].to_f
      @latitude = args[:latitude].to_f
      @distance = args[:distance].to_f
    end

    def longitude_east
      longitude + (distance / (69 * Math.cos(latitude)).abs)
    end

    def longitude_west
      longitude - (distance / (69 * Math.cos(latitude)).abs)
    end

    def latitude_north
      latitude + (distance / 69)
    end

    def latitude_south
      latitude - (distance / 69)
    end

    def latitude_range
      [latitude_south, latitude_north]
    end

    def longitude_range
      [longitude_west, longitude_east]
    end
  end
end
