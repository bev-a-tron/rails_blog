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
    let(:controller) { ArticlesController.new }

    context 'without mocking' do
      it 'should return value from method' do
        answer = controller.beverlys_method
        expect(answer).to eq('aaa')
      end
    end

    context 'with mocking' do
      context 'without return' do
        it 'should return nil' do
          expect(controller).to receive(:beverlys_method)
          answer = controller.beverlys_method
          expect(answer).to eq(nil)
        end
      end

      context 'with return' do
        it 'should return the return value' do
          expect(controller).to receive(:beverlys_method).and_return('value')
          answer = controller.beverlys_method
          expect(answer).to eq('value')
        end
      end
    end

    context 'with stubbing' do
      context 'with return' do
        it 'should return the return value' do
          allow(controller).to receive(:helper_method).and_return('cake')
          t = controller.helper_method(2345678)
          expect(t).to eq('cake')
        end
      end

      context 'without return' do
        it 'should return nil' do
          allow(controller).to receive(:helper_method)
          t = controller.helper_method(2345678)
          expect(t).to eq(nil)
        end
      end
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
