module QuestionsHelper
  def form_title
    @question.new_record? ? "New Question" : "Edit Question"
  end

  def answers_by_questions
       question.answers.count
   end
end
