require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when saving a model' do
    subject(:model) { described_class.new(create_params) }

    let(:create_params) do
      {
        first_name: 'King',
        last_name: 'Crawford',
        email: 'king.crawford@gmail.com',
        password: 'asdf'
      }
    end

    context 'with an invalid email' do
      before { create_params.merge!(email: 'asdf') }

      it 'raises an invalid email error' do
        expect { model.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    it 'defaults last_logged_in' do
      model.save!
      expect(model.last_logged_in).to be_present
    end
  end
end
