module QuestionsHelper
  def question_author(question)
    if question.author
      link_to "@#{question.author.nickname}", user_path(question.author.nickname)
    else
      content_tag :i, "Аноним"
    end
  end
end
