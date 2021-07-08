describe 'Refreshes session' do
  describe 'GET /create' do
    it 'returns http success' do
      skip 'the token needs to expire before we refresh it I guess'
      params = {
        email:                 'email@email.com',
        password:              'password',
        password_confirmation: 'password'
      }

      user = User.create(params)

      post '/refresh', params: params

      json_respone = JSON.parse(response.body)

      request_params = {
        headers: {
          Authorization: "Bearer #{json_respone['access']}"
        }
      }

      delete '/signin', request_params
      expect(response).to have_http_status(:success)

      user.destroy
    end
  end
end
