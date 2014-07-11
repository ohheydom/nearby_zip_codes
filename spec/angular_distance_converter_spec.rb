require_relative '../lib/nearby_zip_codes/angular_distance_converter'

describe NearbyZipCodes::AngularDistanceConverter do
  little_falls_long = -74.214388
  little_falls_lat = 40.882548
  little_falls = NearbyZipCodes::AngularDistanceConverter.new(longitude: little_falls_long, latitude: little_falls_lat, distance: 5)

  describe '#longitude_east' do
    it 'returns the easternmost point' do
      expect(little_falls.longitude_east.to_s).to match(/-74.14.*/)
    end
  end

  describe '#longitude_west' do
    it 'returns the westernmost point' do
      expect(little_falls.longitude_west.to_s).to match(/-74.28*/)
    end
  end

  describe '#latitude_north' do
    it 'returns the northernmost point' do
      expect(little_falls.latitude_north.to_s).to match(/40.95*/)
    end
  end

  describe '#latitude_south' do
    it 'returns the southernnmost point' do
      expect(little_falls.latitude_south.to_s).to match(/40.81*/)
    end
  end
end
