class UpdateSignatureCountsJob < ApplicationJob
  queue_as :highest_priority

  delegate :update_signature_counts, to: :Site
  delegate :signature_count_updated_at, to: :Site
  delegate :signature_count_interval, to: :Site
  delegate :signature_count_updated_at!, to: :Site
  delegate :petition_ids_signed_since, to: :Signature

  rescue_from StandardError do |exception|
    log_exception(exception)
    retry_job(wait: signature_count_interval)
  end

  def perform(now = Time.current)
    return unless update_signature_counts

    petitions.each do |petition|
      last_signed_at = petition.last_signed_at
      petition.increment_signature_count!(now)

      ConstituencyPetitionJournal.increment_signature_counts_for(petition, last_signed_at)
      CountryPetitionJournal.increment_signature_counts_for(petition, last_signed_at)
    end

    signature_count_updated_at!(now)
    reschedule_job(scheduled_time(now))
  end

  private

  def log_exception(exception)
    logger.info(log_message(exception))
  end

  def petition_ids
    petition_ids_signed_since(signature_count_updated_at)
  end

  def petitions
    Petition.where(id: petition_ids)
  end

  def reschedule_job(time)
    self.class.set(wait_until: time).perform_later
  end

  def scheduled_time(now)
    signature_count_interval.seconds.since(now)
  end
end
