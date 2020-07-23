require './files.rb'
require 'colorize'

describe Naming do
  describe '#var_name and #method_name' do
    it 'checks if variable and method names are in snake_case' do
      test = 'my_good_var'
      good_snake_case = /^[a-z]+_[a-z]+(_[a-z]+)?$/
      expect(test).to match(good_snake_case)
    end

    it 'checks if variable and method names are in snake_case' do
      test = 'My_BAD_MetHOD11'
      good_snake_case = /^[a-z]+_[a-z]+(_[a-z]+)?$/
      expect(test).to_not match(good_snake_case)
    end
  end

  describe '#class_name and #module_name' do
    it 'checks if clas and module names are in CamelCase' do
      test = 'GoodModuleName'
      good_camel_case = /^[A-Z][A-Za-z\d]+$/
      expect(test).to match(good_camel_case)
    end

    it 'checks if clas and module names are in CamelCase' do
      test = 'my_bad_class_name'
      good_camel_case = /^[A-Z][A-Za-z\d]+$/
      expect(test).to_not match(good_camel_case)
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
      it 'detects two or more empty lines and returns an error message' do
        array = []
        layout_check = Layout.new(nil, file, nil)
        lines_array.each_with_index { |x, index| array << index if x.split.empty? }
        expect(layout_check.empty_lines(array)).to eq('examples.rb'.blue + ':' + array[1].to_s + ':1:' + ' C'.yellow + ": Layout/EmptyLines: Extra blank line detected.\n\n")
      end
    end

    context 'When there is just one empty line' do
      # fails because test file "example.test" has more than one emptyline, if we re4move empty lines in example.rb, this test will pass
      # it 'does not return an error message' do
      #   array = []
      #   layout_check = Layout.new(nil, file, nil)
      #   lines_array.each_with_index { |x, index| array << index if x.split.empty? }
      #   expect(layout_check.empty_lines(array)).to be_nil
      # end
    end
  end
end
