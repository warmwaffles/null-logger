# frozen_string_literal: true

RSpec.describe NullLogger do
  let(:logger) { described_class.new }

  context 'logs level handling' do
    it 'return nil if call method from LOG_LEVELS array' do
      expect(logger.warn).to be nil
    end

    it 'raise exception if call method which not exist in LOG_LEVELS array' do
      expect { logger.warnnnn }.to raise_error(NoMethodError)
    end
  end

  describe '#respond_to_missing?' do
    context 'when this is a log level' do
      it { expect(logger.send(:respond_to_missing?, :warn)).to be true }
    end

    context 'when this is not a log level' do
      it { expect(logger.send(:respond_to_missing?, :warnnnn)).to be false }
    end
  end
end
