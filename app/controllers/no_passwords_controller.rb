class NoPasswordsController < ApplicationController
  before_action :set_no_password, only: [:show, :edit, :update, :destroy]

  # GET /no_passwords
  # GET /no_passwords.json
  def index
    @no_passwords = NoPassword.all
  end

  # GET /no_passwords/1
  # GET /no_passwords/1.json
  def show
  end

  # GET /no_passwords/new
  def new
    @no_password = NoPassword.new
  end

  # GET /no_passwords/1/edit
  def edit
  end

  # POST /no_passwords
  # POST /no_passwords.json
  def create
    @no_password = NoPassword.new(no_password_params)

    respond_to do |format|
      if @no_password.save
        format.html { redirect_to @no_password, notice: 'No password was successfully created.' }
        format.json { render :show, status: :created, location: @no_password }
      else
        format.html { render :new }
        format.json { render json: @no_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /no_passwords/1
  # PATCH/PUT /no_passwords/1.json
  def update
    respond_to do |format|
      if @no_password.update(no_password_params)
        format.html { redirect_to @no_password, notice: 'No password was successfully updated.' }
        format.json { render :show, status: :ok, location: @no_password }
      else
        format.html { render :edit }
        format.json { render json: @no_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /no_passwords/1
  # DELETE /no_passwords/1.json
  def destroy
    @no_password.destroy
    respond_to do |format|
      format.html { redirect_to no_passwords_url, notice: 'No password was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_no_password
      @no_password = NoPassword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def no_password_params
      params.require(:no_password).permit(:text)
    end
end
