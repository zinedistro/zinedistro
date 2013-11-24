require_relative '../../app/helpers/application_helper.rb'
describe ApplicationHelper do
  let(:zine) { build :zine }
  describe 'sanizize_seo_zine_path' do
    sanitized_seo_zine_path(zine).should be_false
  end
end
