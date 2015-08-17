class Feedback < ActiveRecord::Base
  validates :meet_needs_answer, presence: true
  validates :meet_needs_answer, inclusion: { in: 1..5 }

  def self.questions
    {
        one:   'How well did these spica shorts meet the needs of your family?',
        two:   'Do you have any suggestions to make our pattern better?',
        three: 'What clothing related challenges did your family face while you or your family member was in a spica cast?'
    }
  end

  def row_classes
    ret = 'showable '
    case self.meet_needs_answer
      when 5
        ret += 'success'
      when 4
        ret += 'info'
      when 2
        ret += 'warning'
      when 1
        ret += 'danger'
      else
        ret
    end
    ret
  end
end
