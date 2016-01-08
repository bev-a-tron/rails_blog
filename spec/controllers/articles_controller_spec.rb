require 'rails_helper'

RSpec.describe ArticlesController do

  describe '#testingRandomStuff' do
    it 'should be true' do
      expect(true).to be(true)
    end

    it 'should be false' do
      expect(false).to be(false)
    end
  end

  describe '#beverlysMethod' do
    let (:controller) { ArticlesController.new }
    it 'should return 100' do
      answer = controller.beverlys_method
      expect(answer).to be(100)
    end
  end

  describe '#helperMethod' do
    let(:controller) { ArticlesController.new }
    it 'should return aaa' do
      answer = controller.helper_method(3)
      expect(answer).to eq('aaa')
      expect(answer).to eql('aaa')
      expect(answer).to_not equal('aaa') # compares equality of IDs
      expect(answer).to_not be('aaa') # compares equality of IDs
    end

  end
end