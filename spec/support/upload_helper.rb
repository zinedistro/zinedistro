def stub_legacy_zine_requests(zine)
  stub_request(:get, %r{http://assets\.zinedistro\.org/zines/.*/#{zine.legacy_id}\.(pdf|png)}).
  to_return(-> (request) {
    fixture = case request.uri.extname
              when '.png'
                "spec/fixtures/images/transparent.png"
              when '.pdf'
                "spec/fixtures/pdfs/transparent.pdf" 
              else
                fail
              end
    { body: File.open(fixture) }
  })
end
