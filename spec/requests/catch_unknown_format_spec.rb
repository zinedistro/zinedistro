require 'rails_helper'

describe 'A client submits a request with an invalid format' do
  it 'returns 400' do
    headers = {
      'ACCEPT' => 'application/json'
    }
    get '/admin/login.aspx', headers

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:bad_request)
    expect(response.body).to match('There was a problem with the given format')
  end
end
