require 'rails_helper'

feature 'A client submits JSON' do
  scenario 'submitting invalid JSON', js: true do
    invalid_tokens = ', , '
    broken_json = %|{"notice":{"title":"A sweet title"#{invalid_tokens}}}|

    curb = post_broken_json_to_api('/notices', broken_json)

    expect(curb.response_code).to eq 400
    expect(curb.content_type).to match(/application\/json/)
    expect(curb.body_str).to match(
      'There was a problem in the JSON you submitted:'
    )
  end

  def post_broken_json_to_api(path, broken_json)
    Curl.post("http://#{host}:#{port}#{path}", broken_json) do |curl|
      set_default_headers(curl)
    end
  end

  def host
    Capybara.current_session.server.host
  end

  def port
    Capybara.current_session.server.port
  end

  def set_default_headers(curl)
    curl.headers['Accept'] = 'application/json'
    curl.headers['Content-Type'] = 'application/json'
  end
end
