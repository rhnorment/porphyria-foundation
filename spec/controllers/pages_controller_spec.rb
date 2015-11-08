require 'rails_helper'

describe PagesController, '#show', type: :controller do
  %w(home leadership).each do |page|
    context 'on GET to /pages/#{page}' do
      before do
        get :show, id: page
      end

      it { should respond_with(:success) }
      it { should render_template(page) } 
    end
  end
end


