class AnnotationsController < ApplicationController
    before_action :set_annotation

    def edit
        print(@annotation)
    end

    def update
        respond_to do |format|
            if @annotation.update(annotation_params)
                if @annotation.formStage == 1
                    flash[:success] = "Paraphrasing and Reviews Annotated."
                    format.html { redirect_to complete_task2_path(@annotation)}
                    format.json { render :show, status: :ok, location: @annotation }
                elsif @annotation.formStage == 2
                    flash[:success] = "Product Attributes Annotated."
                    format.html { redirect_to complete_task3_path(@annotation)}
                    format.json { render :show, status: :ok, location: @annotation }
                elsif @annotation.formStage == 3
                    flash[:success] = "QnAs Annotated."
                    format.html { redirect_to complete_task4_path(@annotation)}
                    format.json { render :show, status: :ok, location: @annotation }
                elsif @annotation.formStage == 4
                    flash[:success] = "Answerability Annotated."
                    format.html { redirect_to complete_task5_path(@annotation)}
                    format.json { render :show, status: :ok, location: @annotation }
                else
                    flash[:success] = "Task Fully Annotated."
                    format.html { redirect_to current_user}
                    format.json { render :show, status: :ok, location: @annotation }
                end
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
      params.require(:annotation).permit(:paraphrase, :answer, :assigned, :finished, :annotatorID, :externalSources, :answerable, :formStage, :highly_relevant_reviews => [], :highly_relevant_product_attributes => [], :highly_relevant_qnas => [], :partially_relevant_reviews => [], :partially_relevant_product_attributes => [], :partially_relevant_qnas => [], :irrelevant_reviews => [], :irrelevant_product_attributes => [], :irrelevant_qnas => [], :not_sure_reviews =>[], :not_sure_product_attributes =>[], :not_sure_qnas =>[])
    end
end
