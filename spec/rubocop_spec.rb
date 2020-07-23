require './files.rb'

# describe Naming do
#   let(:file) { 'examples.rb' }
#   # let(:lines_array) do
#   #   arr = []
#   #   File.readlines(file).each do |line|
#   #     arr << line.chomp!
#   #   end
#   # end
#   describe '#var_name' do
#     it 'checks if variable names are in snake_case' do
#       line_num = 1
#       File.readlines(file).each do |line|
#         name_check = Naming.new(line, file, line_num)
#         line_num += 1
        
#       expect(print name_check.var_name).to eq (file.blue + ':' + 3.to_s + ':' + 2.to_s + ':' + ' C'.yellow + ": Naming/MethodName: Use snake_case for method names.\n  " + "my_varR23H\n\n")
#       end
#     end
#   end
# end

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
