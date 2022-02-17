RSpec.describe Comment, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column(:body).of_type(:text) }
    it { is_expected.to have_db_column(:article_id).of_type(:bigint) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:article) }
  end

  describe 'Factory' do
    it 'is expected to have a valid factory' do
      expect(create(:comment)).to be_valid
    end
  end
end
