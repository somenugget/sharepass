class PasswordRepository < Hanami::Repository
  associations do
    has_many :transitions
  end

  def find_by_slug(slug)
    passwords.where(slug: slug).first
  end

  def find_by_slug_with_transitions(slug)
    aggregate(:transitions).where(slug: slug).map_to(Password).one
  end
end
