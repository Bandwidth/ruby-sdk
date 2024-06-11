# Unit tests for Bandwidth::ApiError
describe Bandwidth::ApiError do
  describe '#initialize' do
    it 'initializes an instance of ApiError with message' do
      api_error = Bandwidth::ApiError.new({ message: 'test' })
      expect(api_error.message).to eq('test')
    end
  end

  describe '#to_s' do
    it 'returns message when to_s is called' do
      api_error = Bandwidth::ApiError.new('test')
      expect(api_error.to_s).to eq('test')
    end
  end

  describe '#message' do
    it 'returns default error message when none supplied' do
      api_error = Bandwidth::ApiError.new
      expect(api_error.message).to eq('Error message: the server returns an error')
    end
  end
end
