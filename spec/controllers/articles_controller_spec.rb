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

    describe '#beverlysMethod#helperMethod' do
      let(:controller) { ArticlesController.new }

      it 'should return value from the stub' do
        allow(controller).to receive(:helper_method).with(3).and_return('louuuu')
        p = controller.beverlys_method
        expect(p).to eq('louuuu')
      end

      it 'should have a Mock error' do
        allow(controller).to receive(:helper_method).with(2).and_return('hello')
        expect { controller.beverlys_method }.to raise_error(RSpec::Mocks::MockExpectationError)
      end

      it 'should do stuff' do
        expect(controller).to receive(:helper_method)
        controller.beverlys_method
      end
    end
  end

  describe '#beverlysMethodNoHelper' do
    let(:controller) { ArticlesController.new }

    it 'should not do stuff' do
      expect(controller).to receive(:helper_method)
      expect(controller).to receive(:beverlys_method_no_helper)
      expect { controller.beverlys_method_no_helper }.to raise_error(RSpec::Mocks::MockExpectationError)
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

    context 'with stubbing' do
      context 'with return' do
        it 'should return the return value' do
          allow(controller).to receive(:helper_method).and_return('cake')
          t = controller.helper_method(2_345_678)
          expect(t).to eq('cake')
        end
      end

      context 'without return' do
        it 'should return nil' do
          allow(controller).to receive(:helper_method)
          t = controller.helper_method(2_345_678)
          expect(t).to eq(nil)
        end
      end
    end

    it 'cannot receive input arguments that are not specified' do
      allow(controller).to receive(:helper_method).with(100).and_return('pineapples')
      expect { controller.helper_method(10) }.to raise_error(RSpec::Mocks::MockExpectationError)
      controller.helper_method(100)
    end
  end

  describe '#lulu' do
    let(:controller) { ArticlesController.new }

    it 'should be true' do
      t = controller.lulu(1)
      expect(t).to be(true)
    end

    it 'should be false' do
      t = controller.lulu(2)
      expect(t).to be(false)
    end
  end

  describe '#callsLulu' do
    let(:controller) { ArticlesController.new }

    it 'should be true' do
      t = controller.calls_lulu(1)
      expect(t).to be(true)
    end

    it 'should be false' do
      t = controller.calls_lulu(2)
      expect(t).to be(false)
    end

    context 'mock the call to lulu' do
      context 'set return value' do
        it 'should be false' do
          expect(controller).to receive(:lulu).with(1) # note: returns nil
          t = controller.calls_lulu(1)
          expect(t).to eq('monkeys!!!')
        end

        it 'should be monkeys' do
          expect(controller).to receive(:lulu).with(1).and_return(false)
          t = controller.calls_lulu(1)
          expect(t).to eq('monkeys!!!')
        end

        it 'should be true' do
          expect(controller).to receive(:lulu).with(2).and_return(true) # does not expect true, sets it to true
          t = controller.calls_lulu(2)
          expect(t).to be(true)
        end
      end
    end
  end
end
