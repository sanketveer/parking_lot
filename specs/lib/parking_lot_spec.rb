require_relative '../../lib/parking_lot'

describe ParkingLot do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new parking lot instance' do
        parking_lot = ParkingLot.new('1')
        expect(parking_lot.spots.length).to eql(1)
        expect(parking_lot.spots[0].id).to eql(1)
        parking_lot2 = ParkingLot.new(2)
        expect(parking_lot2.spots.length).to eql(2)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { ParkingLot.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'park' do
    context 'given input paramaters is correct & spots are free' do
      it 'allocates a spot to the car' do
        parking_lot = ParkingLot.new('1')
        parking_lot.park('reg_no', 'color')
        expect(parking_lot.spots[0].reg_no).to eql('reg_no')
        expect(parking_lot.spots[0].color).to eql('color')
      end
    end

    context 'given input paramaters is correct & spots are not free' do
      it 'logs errors' do
        parking_lot = ParkingLot.new('1')
        parking_lot.park('reg_no', 'color')
        expect do
            parking_lot.park('reg_no1', 'color1')
        end.to output("parking is full\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingLot.new('1')
        expect { parking_lot.park }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'leave' do
    context 'given input paramaters is correct and within spot range' do
      it 'free a spot for any car' do
        parking_lot = ParkingLot.new('1')
        parking_lot.park('reg_no', 'color')
        parking_lot.leave(1)
        expect(parking_lot.spots[0].free?).to eql(true)
        parking_lot.leave(1)
        expect(parking_lot.spots[0].free?).to eql(true)
      end
    end

    context 'given input paramaters is correct but outside spots available' do
      it 'logs spot error' do
        parking_lot = ParkingLot.new('1')
        parking_lot.park('reg_no', 'color')
        expect do
            parking_lot.leave(10)
        end.to output("Envalid spot number\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingLot.new('1')
        expect { parking_lot.leave }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'registration_numbers_for_cars_with_colour' do
    context 'given input paramaters is correct & cars found' do
      it 'returns car numbers in comma seperated format' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.registration_numbers_for_cars_with_colour('color')
        end.to output("reg_no,reg_no2\n").to_stdout
      end
    end

    context 'given input paramaters is correct & cars not found' do
      it 'returns empty string' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.registration_numbers_for_cars_with_colour('color2')
        end.to output("\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingLot.new('1')
        expect { parking_lot.registration_numbers_for_cars_with_colour }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'ticket_numbers_for_cars_with_colour' do
    context 'given input paramaters is correct & spots found' do
      it 'returns car numbers in comma seperated format' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.ticket_numbers_for_cars_with_colour('color')
        end.to output("1,3\n").to_stdout
      end
    end

    context 'given input paramaters is correct & spots not found' do
      it 'returns empty string' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.ticket_numbers_for_cars_with_colour('color2')
        end.to output("\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingLot.new('1')
        expect { parking_lot.ticket_numbers_for_cars_with_colour }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'ticket_number_for_registration_number' do
    context 'given input paramaters is correct & car found' do
      it 'returns car numbers in comma seperated format' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.ticket_number_for_registration_number('reg_no')
        end.to output("1\n").to_stdout
      end
    end

    context 'given input paramaters is correct & car not found' do
      it 'returns empty string' do
        parking_lot = ParkingLot.new(5)
        parking_lot.park('reg_no', 'color')
        parking_lot.park('reg_no1', 'color1')
        parking_lot.park('reg_no2', 'color')
        parking_lot.park('reg_no3', 'color1')
        expect do
            parking_lot.ticket_number_for_registration_number('reg_no5')
        end.to output("Not Found\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingLot.new('1')
        expect { parking_lot.ticket_number_for_registration_number }.to raise_error(ArgumentError)
      end
    end
  end
end