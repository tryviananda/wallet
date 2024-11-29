RSpec.describe 'Sessions API', type: :request do
    it 'logs in a user' do
      user = User.create(email: 'test@example.com', password: 'password')
      post '/sessions', params: { email: user.email, password: 'password' }
      expect(response).to have_http_status(:success)
    end
  end
  