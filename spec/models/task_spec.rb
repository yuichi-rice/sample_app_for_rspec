require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    #before do
    #  user_a = FactoryBot.create(:user, email: 'a@example.com', password: 'password', password_confirmation: 'password')
    #end
    
    it 'is valid with all attributes' do
      task = FactoryBot.build(:task)
      expect(task).to be_valid
    end

    it 'is invalid without title' do
      task = FactoryBot.build(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without status' do
      task = FactoryBot.build(:task, status: nil)
      task.valid?
      expect(task.errors[:status]).to include("can't be blank")
    end

    it 'is invalid with a daplicate title' do
      FactoryBot.create(:task)
      task = FctoryBot.create(:task, title: 'test', content: 'testcontent1', status: 0)
      expect(task.errors[:title]).to include("uniqueness")
    end

    it 'is valid with another title ' do
      FactoryBot.create(:task)
      task = FactoryBot(:task, title: 'test1')
      expect(task).to be_valid
    end
  end
end
