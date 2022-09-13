class ApplicationController < ActionController::Base
    include SessionsHelper

    def findIncompleteAnnotation
        #@annotations = Annotation.where(assigned: 0).or(Annotation.where("finished: ? and Time.current - "))
        @annotations = Annotation.all
        @filtAnnotations = @annotations.reject {|annotation| (annotation.finished == true) || (Time.current - annotation.updated_at < 1*60*60)} 
        
        if !@filtAnnotations.empty?
          annotation = @filtAnnotations.sample
          annotation.assigned = 0
          annotation.save
          annotation.assigned = 1
          annotation.save
          redirect_to makes_sense_path(annotation)
          return
        end
        
=begin       
        if annotation.assigned == false
          annotation.assigned = 1
          annotation.save
          redirect_to makes_sense_path(annotation)
          return
        elsif (annotation.assigned == true) && (annotation.finished == false) && (Time.current - annotation.updated_at > 1*60*60)
          annotation.assigned = 0
          annotation.save
          annotation.assigned = 1
          annotation.save
          redirect_to makes_sense_path(annotation)
          return
        end
=end
        redirect_to taskComplete_path
      end

end
