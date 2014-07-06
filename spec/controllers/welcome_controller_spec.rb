require 'rails_helper'

describe WelcomeController, :type => :controller do
  describe "#index" do
    before do
      visit '/'
    end

    describe "Student authorization", :js => true do
      before do
        @cohort = create(:cohort)
        @student = @cohort.students << build(:student)
      end

      it 'should allow login' do
        within("#session") do
          fill_in 'Email', :with => 'user@example.com'
          fill_in 'Password', :with => 'password'
        end
        click_button 'Sign in'
        expect(page).to have_content 'Success'
      end
    end

    describe "Employer authorization" do

    end
  end
end
