require 'rails_helper'

RSpec.describe User, type: :model do
  #describe 'associations' do
  #  it { should has_many(:id).class_name('Photo') }
  #  it { should has_many(:id).class_name('Album') }

  #end

  describe 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
end
