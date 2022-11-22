class AnnotationsController < ApplicationController
    #before_action :set_annotation

    def index
        @annotations = Annotation.where(finished: true)
        @completed = @annotations.reject {|annotation| (annotation.finished == false)}
        respond_to do |format|
            format.html
            format.csv {send_data @annotations.to_csv, filename: "CompletedAnnotations-#{Time.now}.csv"}
        end
    end
    
    def show
        @annotations = Annotation.where(finished: true)
        @completed = @annotations.reject {|annotation| (annotation.finished == false)}
        respond_to do |format|
            format.html
            format.csv {send_data @annotations.to_csv, filename: "CompletedAnnotations-#{Time.now}.csv" }
        end
    end

    def edit
        set_annotation
        print(@annotation)
    end

    def update
        set_annotation
        respond_to do |format|
            if @annotation.update(annotation_params)

                if @annotation.makes_sense
                    if @annotation.formStage == 0
                        flash[:success] = "Sensibility Annotated."
                        format.html { redirect_to complete_task_path(@annotation)}
                        format.json { render :show, status: :ok, location: @annotation }
                    elsif @annotation.formStage == 1
                        @annotation.highly_relevant_reviews.reject! {|evidence| evidence == "0"}
                        @annotation.partially_relevant_reviews.reject! {|evidence| evidence == "0"}
                        @annotation.irrelevant_reviews.reject! {|evidence| evidence == "0"}
                        @annotation.not_sure_reviews.reject! {|evidence| evidence == "0"}
                        @annotation.save
                        @annotation.reviews.each do |evidence|
                            if ((!(@annotation.highly_relevant_reviews.include? evidence)) and (!(@annotation.partially_relevant_reviews.include? evidence)) and (!(@annotation.irrelevant_reviews.include? evidence)) and (!(@annotation.not_sure_reviews.include? evidence)) )
                                @annotation.irrelevant_reviews.append(evidence)
                            end
                        end
                        @annotation.save
                        flash[:success] = "Paraphrasing and Reviews Annotated."
                        format.html { redirect_to complete_task2_path(@annotation)}
                        format.json { render :show, status: :ok, location: @annotation }
                    elsif @annotation.formStage == 2
                        @annotation.highly_relevant_product_attributes.reject! {|evidence| evidence == "0"}
                        @annotation.partially_relevant_product_attributes.reject! {|evidence| evidence == "0"}
                        @annotation.irrelevant_product_attributes.reject! {|evidence| evidence == "0"}
                        @annotation.not_sure_product_attributes.reject! {|evidence| evidence == "0"}
                        @annotation.save
                        @annotation.productAttributes.each do |evidence|
                            if ((!(@annotation.highly_relevant_product_attributes.include? evidence.to_json)) and (!(@annotation.partially_relevant_product_attributes.include? evidence.to_json)) and (!(@annotation.irrelevant_product_attributes.include? evidence.to_json)) and (!(@annotation.not_sure_product_attributes.include? evidence.to_json)) )
                                @annotation.irrelevant_product_attributes.append(evidence.to_json)
                            end
                        end
                        @annotation.save
                        flash[:success] = "Product Attributes Annotated."
                        format.html { redirect_to complete_task3_path(@annotation)}
                        format.json { render :show, status: :ok, location: @annotation }
                    elsif @annotation.formStage == 3
                        @annotation.highly_relevant_descriptions.reject! {|evidence| evidence == "0"}
                        @annotation.partially_relevant_descriptions.reject! {|evidence| evidence == "0"}
                        @annotation.irrelevant_descriptions.reject! {|evidence| evidence == "0"}
                        @annotation.not_sure_descriptions.reject! {|evidence| evidence == "0"}
                        @annotation.save
                        @annotation.productDesc.each do |evidence|
                            if ((!(@annotation.highly_relevant_descriptions.include? evidence)) and (!(@annotation.partially_relevant_descriptions.include? evidence)) and (!(@annotation.irrelevant_descriptions.include? evidence)) and (!(@annotation.not_sure_descriptions.include? evidence)) )
                                @annotation.irrelevant_descriptions.append(evidence)
                            end
                        end
                        @annotation.save
                        flash[:success] = "Product Descriptions Annotated."
                        format.html { redirect_to complete_task4_path(@annotation)}
                        format.json { render :show, status: :ok, location: @annotation }
                    elsif @annotation.formStage == 4
                        @annotation.highly_relevant_qnas.reject! {|evidence| evidence == "0"}
                        @annotation.partially_relevant_qnas.reject! {|evidence| evidence == "0"}
                        @annotation.irrelevant_qnas.reject! {|evidence| evidence == "0"}
                        @annotation.not_sure_qnas.reject! {|evidence| evidence == "0"}
                        @annotation.save
                        @annotation.QnAs.each do |evidence|
                            if ((!(@annotation.highly_relevant_qnas.include? evidence)) and (!(@annotation.partially_relevant_qnas.include? evidence)) and (!(@annotation.irrelevant_qnas.include? evidence)) and (!(@annotation.not_sure_qnas.include? evidence)) )
                                @annotation.irrelevant_qnas.append(evidence)
                            end
                        end
                        @annotation.save
                        flash[:success] = "QnAs Annotated."
                        format.html { redirect_to complete_task5_path(@annotation)}
                        format.json { render :show, status: :ok, location: @annotation }
                    else
                        flash[:success] = "Task Fully Annotated."
                        cluster = Annotation.where(clusterID: @annotation.clusterID)
                        numComplete = @annotation.numOfClusterCompleted+1
                        cluster.each do |a|
                            a.numOfClusterCompleted = numComplete
                            a.save
                        end
                        format.html { redirect_to current_user}
                        format.json { render :show, status: :ok, location: @annotation }
                    end
                elsif @annotation.makes_sense == nil
                    flash[:success] = "No answer marked."
                    format.html { redirect_to makes_sense_path(@annotation)}
                    format.json { render :show, status: :ok, location: @annotation }
                else
                    @annotation.finished = true
                    @annotation.save
                    cluster = Annotation.where(clusterID: @annotation.clusterID)
                        numComplete = @annotation.numOfClusterCompleted+1
                        cluster.each do |a|
                            a.numOfClusterCompleted = numComplete
                            a.save
                        end
                    flash[:success] = "Nothing else to annotate."
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
      params.require(:annotation).permit(:paraphrase, :answer, :assigned, :finished, :annotatorID, :externalSources, :answerable, :formStage, :makes_sense,:makes_sense_note, :paraphrase_reviews_note, :attributes_note, :description_note, :qna_note, :answer_generation_note, :numOfClusterCompleted, :highly_relevant_reviews => [], :highly_relevant_product_attributes => [], :highly_relevant_descriptions => [], :highly_relevant_qnas => [], :partially_relevant_reviews => [], :partially_relevant_product_attributes => [], :partially_relevant_descriptions => [], :partially_relevant_qnas => [], :irrelevant_reviews =>[], :irrelevant_product_attributes => [], :irrelevant_descriptions =>[], :irrelevant_qnas => [], :not_sure_reviews =>[], :not_sure_product_attributes =>[], :not_sure_descriptions =>[], :not_sure_qnas =>[])
    end
end
