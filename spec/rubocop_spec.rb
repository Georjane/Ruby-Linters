require './bin/rubocop.rb'
# require './examples.rb'

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
