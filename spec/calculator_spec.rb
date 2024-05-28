RSpec.describe Calculator do
  it "has a version number" do
    expect(Calculator::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(Calculator::StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(Calculator::StringCalculator.add("1")).to eq(1)
      expect(Calculator::StringCalculator.add("5")).to eq(5)
    end
    
  end

end