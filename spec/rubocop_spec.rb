require './files.rb'

describe Naming do
  describe '#var_name and #method_name' do
    it 'checks if variable and method names are in snake_case' do
      test = "my_good_var"
      good_snake_case = /^[a-z]+_[a-z]+(_[a-z]+)?$/
      expect(test).to match(good_snake_case)
    end

    it 'checks if variable and method names are in snake_case' do
      test = "My_BAD_MetHOD11"
      good_snake_case = /^[a-z]+_[a-z]+(_[a-z]+)?$/
      expect(test).to_not match(good_snake_case)
    end
  end

end

describe Layout do
  let(:file) { 'examples.rb' }
  let(:lines_array) do
    arr = []
    File.readlines(file).each do |line|
      arr << line.chomp!
    end
  end

  describe '#empty_lines' do
    context 'checks when there are two or more empty lines consecutively' do
      it 'detects two empty lines and returns an error message' do
        array = []
        layout_check = Layout.new(nil, file, nil)
        lines_array.each_with_index { |x, index| array << index if x.split.empty? }
        expect(layout_check.empty_lines(array)).to eq('examples.rb'.blue + ':' + array[1].to_s + ':1:' + ' C'.yellow + ": Layout/EmptyLines: Extra blank line detected.\n\n")
      end
    end

    context 'When there is just one empty line' do
      it 'does not return an error message' do
        array = []
        layout_check = Layout.new(nil, file, nil)
        lines_array.each_with_index { |x, index| array << index if x.split.empty? }
        expect(layout_check.empty_lines(array)).to eq(nil)
        # else has to return no errors
      end
    end
  end
end
