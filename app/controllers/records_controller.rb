class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:track, :result]

  def index
    @records = Record.all.where(["client_name like ?", "%#{params[:search]}%"])
  end

  def track
    @records = Record.all.where(["id like ? OR client_name like ?", "%#{params[:search]}%", "%#{params[:search]}%"]).limit(1)
  end

  def result
    @records = Record.all.where(["id like ? OR client_name like ?", "%#{params[:search]}%", "%#{params[:search]}%"]).limit(1)
  end

  def show
  end

  def new
    @record = current_user.records.build
  end

  def edit
  end

  def create
    @record = current_user.records.build(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: "Record was successfully created." }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: "Record was successfully updated." }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: "Record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:client_name, :client_email, :client_contact, :client_address, :service, :status, :description, :user_id)
    end
end
