  require 'csv'
  desc "Import customers from CSV file"
  task :import => :environment do
    file = 'db/csv_seed/customers.csv'
    CSV.foreach(file, headers: true) do |row|
      customer_hash = row.to_hash
      customer = Customer.where(id: customer_hash["id"])
      if customer.count == 1
        customer.first.update_attributes(customer_hash)
      else
        Customer.create!(customer_hash)
      end
    end

    file = 'db/csv_seed/merchants.csv'
    CSV.foreach(file, headers: true) do |row|
      merchant_hash = row.to_hash
      merchant = Merchant.where(id: merchant_hash["id"])
      if merchant.count == 1
        merchant.first.update_attributes(merchant_hash)
      else
        Merchant.create!(merchant_hash)
      end
    end

    file = 'db/csv_seed/items.csv'
    CSV.foreach(file, headers: true) do |row|
      item_hash = row.to_hash
      item = Item.where(id: item_hash["id"])
      if item.count == 1
        item.first.update_attributes(item_hash)
      else
        Item.create!(item_hash)
      end
    end

    file = 'db/csv_seed/invoices.csv'
    CSV.foreach(file, headers: true) do |row|
      invoice_hash = row.to_hash
      invoice = Invoice.where(id: invoice_hash["id"])
      if invoice.count == 1
        invoice.first.update_attributes(invoice_hash)
      else
        Invoice.create!(invoice_hash)
      end
    end

    file = 'db/csv_seed/invoice_items.csv'
    CSV.foreach(file, headers: true) do |row|
      invoice_item_hash = row.to_hash
      invoice_item = InvoiceItem.where(id: invoice_item_hash["id"])
      if invoice_item.count == 1
        invoice_item.first.update_attributes(invoice_item_hash)
      else
        InvoiceItem.create!(invoice_item_hash)
      end
    end

    file = 'db/csv_seed/transactions.csv'
    CSV.foreach(file, headers: true) do |row|
      transaction_hash = row.to_hash
      transaction = Transaction.where(id: transaction_hash["id"])
      if transaction.count == 1
        transaction.first.update_attributes(transaction_hash)
      else
        Transaction.create!(transaction_hash)
      end
    end
  end
