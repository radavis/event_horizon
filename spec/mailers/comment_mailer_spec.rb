describe CommentMailer do
  describe "new_comment" do
    let(:comment) { FactoryGirl.create(:comment) }
    let(:mail) { CommentMailer.new_comment(comment) }

    it "includes the username of the commenter" do
      expected = "#{comment.user.username} commented on your submission."

      expect(mail.subject).to eq(expected)
      expect(mail.body.encoded).to include(comment.user.username)
    end

    it "includes the name of the lesson" do
      expect(mail.body.encoded).to include(comment.submission.lesson.title)
    end

    it "includes the body of the comment" do
      expect(mail.body.encoded).to include(comment.body)
    end

    it "includes a link to the submission" do
      expect(mail.body.encoded).to include(submission_url(comment.submission))
    end
  end
end
