class AnnotationsController < ApplicationController
    before_action :set_annotation

    def edit
        print(@annotation)
    end

    def update
        respond_to do |format|
            if @annotation.update(annotation_params)
                format.html { redirect_to current_user, notice: "Annotation was successfully made." }
                format.json { render :show, status: :ok, location: @annotation }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @annotation.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_annotation
        id = params[:annotation_id] || params[:id]
        @annotation = Annotation.find(id)
      end

    def annotation_params
      params.require(:annotation).permit(:paraphrase, :answer, :assigned, :finished, :annotatorID, :externalSources, :answerable, :highly_relevant => [], :partially_relevant => [], :irrelevant => [], :notSure =>[])
    end
end
