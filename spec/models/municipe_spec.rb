require 'rails_helper'

RSpec.describe Municipe, type: :model do
  describe "associations" do
    it { should have_many(:municipe_addresses).class_name('MunicipeAddress') }
  end

  describe "Validations" do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:telephone) }
    it { should validate_uniqueness_of(:cpf) }
    it { should validate_uniqueness_of(:cns) }

    it { should allow_value('om30@om30.com').for(:email) }
    it { should_not allow_value('om30.com').for(:email) }
    it { should_not allow_value('om30').for(:email) }

    it "is valid with a valid CPF" do
      municipe = build(:municipe)
      expect(municipe).to be_valid
    end

    it "is invalid with an invalid CPF" do
      municipe = build(:municipe, cpf: '123.456.789-10')
      municipe.valid?
      expect(municipe.errors[:cpf]).to include("CPF inválido")
    end
  end
end
