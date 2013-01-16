# /interview_q_spec.rb

require_relative 'interview_q'

describe "interview_q" do

	describe "check" do

		it "should return false for arrays that have two or more subsets which result in the same sum" do
			check([1, 2, 3, 4, 5, 6, 7, 8]).should be_false
			check([12, 23, 34, 45, 56, 67, 78, 89]).should be_false
		end

		it "should return true for arrays that have no two subsets which sum to the same number" do
			check([100, 99, 98, 96, 93, 87, 76, 56]).should be_true
		end
	end

	describe "find_subset" do

		it "should return an array which has no two subsets which sum to the same number" do
			find_subset.should == [100, 99, 98, 96, 93, 87, 76, 56]
		end

		it "should pass the check" do
			check(find_subset).should be_true
		end
	end
end