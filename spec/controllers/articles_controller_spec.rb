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
    it 'should return 100' do
      controller = ArticlesController.new
      answer = controller.beverlys_method
      expect(answer).to be(100)
    end
  end

end