require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:likes).class_name('Like') }

  end

  describe 'validations' do
    it { should validate_presence_of(:title) and validate_length_of(:tilte).is_at_most(140) }
    it { should validate_presence_of(:description) and validate_length_of(:description).is_at_most(300) }

  end
end
