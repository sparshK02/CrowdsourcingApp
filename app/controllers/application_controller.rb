class ApplicationController < ActionController::Base
    include SessionsHelper

    def findIncompleteAnnotation
        #@annotations = Annotation.where(assigned: 0).or(Annotation.where("finished: ? and Time.current - "))
        @annotations = Annotation.all
        #@interAnnotations = @annotations.reject {|annotation| (annotation.finished == true) || (Time.current - annotation.updated_at < 1*60*60) || (annotation.numOFClusterCompleted >= 3)} 
        @interAnnotations = @annotations.reject {|annotation| (annotation.finished == true) || (annotation.numOfClusterCompleted >= 3)} 
        @filtAnnotations = Array.new
        @interAnnotations.each do |a|
          cluster = Annotation.where(clusterID: a.clusterID)
          alreadyCompleted = false
          cluster.each do |c|
            if c.annotatorID == current_user.annotatorID
              alreadyCompleted = true
            end
          end
          if !alreadyCompleted
            @filtAnnotations << a
          end
        end

        if !@filtAnnotations.empty?
          annotation = @filtAnnotations.sample
          annotation.assigned = 0
          annotation.save
          annotation.assigned = 1
          annotation.save
          redirect_to makes_sense_path(annotation)
          return
        end
        
        redirect_to taskComplete_path
      end

end
