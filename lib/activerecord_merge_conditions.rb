# Hacky back-port of AR::Base#merge_conditions from Rails 2.1.
# Replace with making of built-in merge_conditions when upgrading to 2.1.
# Delete when Rails version is later than 2.1, as this is in post-2.1 Edge.
class ActiveRecord::Base
 def self.merge_conditions(*conditions)
   segments = []
   conditions.each do |condition|
     unless condition.blank?
       sql = sanitize_sql(condition)
       segments << sql unless sql.blank?
     end
   end
   "(#{segments.join(') AND (')})" unless segments.empty?
 end

end