require 'rails_helper'

feature 'A client submits JSON', js: true do
  scenario 'with an invalid format returns 400' do
    request = Curl.get("http://#{host}:#{port}/admin/login.aspx")

    expect(request.response_code).to eq 400
    expect(request.content_type).to match(/application\/json/)
    expect(request.body_str).to match(
      'There was a problem with the given format: aspx'
    )
  end
end
