RSpec.describe 'POST /api/articles/:id/comments', type: :request do
  subject { response }

  let(:article) { create(:article) }

  describe 'Visitor can successfully add a comment' do
    before do
      post "/api/articles/#{article.id}/comments", params: { comment: { body: 'Enjoyed the article. Thank you!' } }
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to create an instance of a comment' do
      expect(Comment.last).to_not eq nil
    end

    it 'is expected to save a comment in DB' do
      expect(Comment.last.body).to eq 'Enjoyed the article. Thank you!'
    end

    it 'is expected to respond with comment body' do
      expect(response_json['comment']['body']).to eq 'Enjoyed the article. Thank you!'
    end
  end
end
