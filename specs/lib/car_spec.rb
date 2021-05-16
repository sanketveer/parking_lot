require_relative '../../lib/car'

describe Car do
  describe 'initialize' do
    context 'input paramaters are correct' do
      it 'returns new car instance' do
        car = Car.new('MH-25-PA-2323', 'red')
        expect(car.class).to eql(Car)
        expect(car.reg_no).to eql('MH-25-PA-2323')
        expect(car.color).to eql('red')
      end
    end

    context 'input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { Car.new }.to raise_error(ArgumentError)
        expect { Car.new('number') }.to raise_error(ArgumentError)
        expect { Car.new('color') }.to raise_error(ArgumentError)
      end
    end
  end
end