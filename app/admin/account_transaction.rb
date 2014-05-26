ActiveAdmin.register AccountTransaction do

  permit_params :user, :question, :status, :value, :action

  # controller do
  #   defaults finder: :find
  # end

  member_action :execute do
    transaction = AccountTransaction.find params[:id]
    transaction.execute!
    redirect_to action: :index
  end

  index do
    selectable_column
    column :id
    column :status
    column :value
    column do |tr|
      link_to 'execute', execute_admin_account_transaction_path(tr)
    end
    actions
  end

end
