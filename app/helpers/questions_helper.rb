module QuestionsHelper
  def form_title
    @question.new_record? ? "New Question" : "Edit Question"
  end
end
