describe 'User Signup' do
  it 'returns the csrf token' do
    params = {
      email:                 'email@email.com',
      password:              'password',
      password_confirmation: 'password'
    }

    post '/signup', params: params

    expect(response).to have_http_status(:success)

    json_response = JSON.parse(response.body)

    expect(json_response['csrf']).to be_present
  end
end
