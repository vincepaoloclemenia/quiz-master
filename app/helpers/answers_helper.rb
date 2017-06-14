module AnswersHelper

	def evaluate_if_zero quiz_ans, stud_ans
		if quiz_ans == "0" || quiz_ans.downcase == "zero" 
				if stud_ans.to_i == 0 
					return true
				else
					return false
				end
		end
	end

	def convert_to_words int 
			numbers_to_name = {
				1000000 => "million",
				1000 => "thousand",
				100 => "hundred",
				90 => "ninety",
				80 => "eighty",
				70 => "seventy",
				60 => "sixty",
				50 => "fifty",
				40 => "forty",
				30 => "thirty",
				20 => "twenty",
				19=>"nineteen",
				18=>"eighteen",
				17=>"seventeen", 
				16=>"sixteen",
				15=>"fifteen",
				14=>"fourteen",
				13=>"thirteen",              
				12=>"twelve",
				11 => "eleven",
				10 => "ten",
				9 => "nine",
				8 => "eight",
				7 => "seven",
				6 => "six",
				5 => "five",
				4 => "four",
				3 => "three",
				2 => "two",
				1 => "one"
			}
			str = ""
			numbers_to_name.each do |num, name|
				if int == 0
					return str
				elsif int.to_s.length == 1 && int/num > 0
					return str + "#{name}"      
				elsif int < 100 && int/num > 0
					return str + "#{name}" if int%num == 0
					return str + "#{name} " + convert_to_words(int%num)
				elsif int/num > 0
					return str + convert_to_words(int/num) + " #{name} " + convert_to_words(int%num)
				end
			end
	end

	def evaluate_answer quiz, answer    
		if quiz.answer.downcase.gsub(/-/, ' ').strip == answer.ans.downcase.gsub(/-/, ' ').strip
			return true 
		elsif quiz.answer.downcase.gsub(/-/, ' ').strip == ( convert_to_words answer.ans.gsub(/ /, '').to_i ).strip
			return true 
		elsif (convert_to_words quiz.answer.to_i).strip ==  answer.ans.downcase.gsub(/-/, ' ').strip
			return true
		elsif (convert_to_words quiz.answer.to_i).strip ==  ( convert_to_words answer.ans.gsub(/ /, '').to_i ).strip
			return true  
		else
			return false
		end
	end

	def evaluate_if_blank stud_ans
		if stud_ans == ""
			return nil
		end
	end
end
