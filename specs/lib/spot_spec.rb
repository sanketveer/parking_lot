require_relative '../../lib/spots'

describe Spot do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new spot instance' do
        spot = Spot.new('1')
        expect(spot.class).to eql(Spot)
        expect(spot.id).to eql(1)
        spot = Spot.new(2)
        expect(spot.id).to eql(2)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { Spot.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'park' do
    context 'given car paramaters are correct' do
      it 'sets car as alloted new car' do
        spot = Spot.new('1')
        spot.park('reg_no', 'color')
        expect(spot.car.class).to eql(Car)
        expect(spot.car.reg_no).to eql('reg_no')
        expect(spot.car.color).to eql('color')
      end

      it 'throws error if a car is parked where spot is filled' do
        binding.pry
        spot = Spot.new('1')
        spot.park('reg_no', 'color')
        expect { spot.park('reg_no1', 'color1') }.to raise_error("Car Already Parked")

      end
    end

    context 'given car paramaters are missing' do
      it 'throws exception due to missing argument errors' do
        spot = Spot.new('1')
        expect { spot.park('x') }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'free' do
    it 'sets car as nil' do
      spot = Spot.new('1')
      spot.free
      expect(spot.car).to eql(nil)
    end
  end

  describe 'free?' do
    context 'no car alloted' do
      it 'returns true' do
        spot = Spot.new('1')
        expect(spot.free?).to eql(true)
      end
    end

    context 'car alloted' do
      it 'returns false' do
        spot = Spot.new('1')
        spot.park('xyz', 'White')
        expect(spot.free?).to eql(false)
      end
    end
  end

  describe 'reg_no' do
    it 'gives nil if no car alloted' do
      spot = Spot.new('1')
      expect(spot.reg_no).to eql(nil)
    end

    it 'gives car number if car alloted' do
      spot = Spot.new('1')
      spot.park('xyz', 'White')
      expect(spot.reg_no).to eql('xyz')
    end
  end

  describe 'color' do
    it 'gives nil if no car alloted' do
      spot = Spot.new('1')
      expect(spot.color).to eql(nil)
    end

    it 'gives car number if car alloted' do
      spot = Spot.new('1')
      spot.park('xyz', 'White')
      expect(spot.color).to eql('White')
    end
  end
end