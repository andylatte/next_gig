namespace :fixes do
  desc "TODO"
  task add_admin_to_crew: :environment do
    User.all.each do |u|
      if u.admin?
        u.crew_members_available << u unless u.crew_members_available.member? u
      end
    end
  end

end
