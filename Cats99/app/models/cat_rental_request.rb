require 'byebug'

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING DENIED APPROVED)}
  validate :overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    where_cond = [<<-SQL, cat_id, start_date, start_date, end_date, end_date]
                cat_id = ?
                AND (start_date <= ? AND end_date >= ?
                    OR start_date <= ? AND end_date >= ?)
                SQL
    CatRentalRequest.where(where_cond).where.not(id: id)
  end

  def overlapping_approved_requests
    unless overlapping_requests.where(status: "APPROVED").empty?
      errors.add(:cat_rental_request, "conflicts with current requests")
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!
      overlapping_pending_requests.each do |request|
        request.deny!
        # request.save!
      end
    end
  end

  def deny!
    status = "DENIED"
    self.save!
  end

  def pending?
    status == "PENDING"
  end

end
