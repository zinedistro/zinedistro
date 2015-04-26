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
