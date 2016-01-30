# From https://robots.thoughtbot.com/catching-json-parse-errors-with-custom-middleware
class CatchJsonParseErrors
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue ActionDispatch::ParamsParser::ParseError => error
    if env['HTTP_ACCEPT'] =~ /application\/json/
      error_output = 'Invalid JSON'
      return [
        400, { 'Content-Type' => 'application/json' },
        [{ status: 400, error: error_output }.to_json]
      ]
    else
      raise error
    end
  end
end
