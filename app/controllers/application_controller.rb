class ApplicationController < ActionController::Base
    include SessionsHelper

    def findIncompleteAnnotation
        @annotations = Annotation.all
        @annotations.each do |annotation|
          if annotation.assigned == false
            annotation.assigned = 1
            annotation.save
            redirect_to makes_sense_path(annotation)
            return
          elsif (annotation.assigned == true) && (annotation.finished == false) && (Time.current - annotation.updated_at > 12*60*60)
            annotation.assigned = 0
            annotation.save
            annotation.assigned = 1
            annotation.save
            redirect_to makes_sense_path(annotation)
            return
          end
        end
        redirect_to taskComplete_path
      end

end
