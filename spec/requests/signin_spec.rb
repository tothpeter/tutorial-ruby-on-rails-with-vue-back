describe 'User signs in' do
  context 'Correct creds' do
    it 'returns http success' do
      params = {
        email:                 'email@email.com',
        password:              'password',
        password_confirmation: 'password'
      }

      user = User.create(params)

      post '/signin', params: params

      expect(response).to have_http_status(:success)

      user.destroy
    end
  end

  context 'Incorrect creds' do
    it 'returns http unauthorized' do
      params = {
        email:                 'email@email.com',
        password:              'password',
        password_confirmation: 'password'
      }

      post '/signin', params: params

      expect(response).to have_http_status(:unauthorized)
    end
  end
end

describe 'User signs out' do
  it 'returns http success' do
    params = {
      email:                 'email@email.com',
      password:              'password',
      password_confirmation: 'password'
    }

    user = User.create(params)

    post '/signin', params: params

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
