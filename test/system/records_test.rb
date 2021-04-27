require "application_system_test_case"

class RecordsTest < ApplicationSystemTestCase
  setup do
    @record = records(:one)
  end

  test "visiting the index" do
    visit records_url
    assert_selector "h1", text: "Records"
  end

  test "creating a Record" do
    visit records_url
    click_on "New Record"

    fill_in "Client address", with: @record.client_address
    fill_in "Client contact", with: @record.client_contact
    fill_in "Client email", with: @record.client_email
    fill_in "Client name", with: @record.client_name
    fill_in "Description", with: @record.description
    fill_in "Service", with: @record.service
    fill_in "Status", with: @record.status
    fill_in "User", with: @record.user_id
    click_on "Create Record"

    assert_text "Record was successfully created"
    click_on "Back"
  end

  test "updating a Record" do
    visit records_url
    click_on "Edit", match: :first

    fill_in "Client address", with: @record.client_address
    fill_in "Client contact", with: @record.client_contact
    fill_in "Client email", with: @record.client_email
    fill_in "Client name", with: @record.client_name
    fill_in "Description", with: @record.description
    fill_in "Service", with: @record.service
    fill_in "Status", with: @record.status
    fill_in "User", with: @record.user_id
    click_on "Update Record"

    assert_text "Record was successfully updated"
    click_on "Back"
  end

  test "destroying a Record" do
    visit records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Record was successfully destroyed"
  end
end
