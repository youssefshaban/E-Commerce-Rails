require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "fail to cretae product without name" do
   brand= Brand.new(name: "labtop",id: 1)
   brand.save
   category= Category.new(name:"electronics",id:1)
   category.save
   sel= Seller.new(name:"seller",email:"seller@gmail.com",password:"123",id:1)
   sel.save
   store= Store.new(name:"store",summary:"new labtop",id:1)
   store.save
   product =  Product.new(quantity: 3,
      currentPrice: 4,
       description: "hi",
        store_id: 1 , 
        brand_id: 1,
        category_id:1)
        assert_not product.save, "Saved the product without a title"

  end
  test "fail to cretae product without quantity" do
    brand= Brand.new(name: "labtop",id: 1)
    brand.save
    category= Category.new(name:"electronics",id:1)
    category.save
    sel= Seller.new(name:"seller",email:"seller@gmail.com",password:"123",id:1)
    sel.save
    store= Store.new(name:"store",summary:"new labtop",id:1)
    store.save
    product =  Product.new(name: "new",
       currentPrice: 4,
        description: "hi",
         store_id: 1 , 
         brand_id: 1,
         category_id:1)
         assert_not product.save, "Saved the product without a quantity"
 
   end
   test "fail to cretae product without current price" do
    brand= Brand.new(name: "labtop",id: 1)
    brand.save
    category= Category.new(name:"electronics",id:1)
    category.save
    sel= Seller.new(name:"seller",email:"seller@gmail.com",password:"123",id:1)
    sel.save
    store= Store.new(name:"store",summary:"new labtop",id:1)
    store.save
    product =  Product.new(name: "new",
       quantity: 4,
        description: "hi",
         store_id: 1 , 
         brand_id: 1,
         category_id:1)
         assert_not product.save, "Saved the product without a current price"
 
   end
   test "fail to cretae product without description" do
    brand= Brand.new(name: "labtop",id: 1)
    brand.save
    category= Category.new(name:"electronics",id:1)
    category.save
    sel= Seller.new(name:"seller",email:"seller@gmail.com",password:"123",id:1)
    sel.save
    store= Store.new(name:"store",summary:"new labtop",id:1)
    store.save
    product =  Product.new(name: "new",
       quantity: 4,
       currentPrice: 5,
         store_id: 1 , 
         brand_id: 1,
         category_id:1)
         assert_not product.save, "Saved the product without a descreption"
 
   end
   test "success to cretae product with all data" do
    brand= Brand.new(name: "labtop",id: 1)
    brand.save
    category= Category.new(name:"electronics",id:1)
    category.save
    sel= Seller.new(name:"seller",email:"seller@gmail.com",password:"123",id:1)
    sel.save
    store= Store.new(name:"store",summary:"new labtop",id:1)
    store.save
    product =  Product.new(name: "new",
       quantity: 4,
       description: "new product",
       currentPrice: 5,
         store_id: 1 , 
         brand_id: 1,
         category_id:1)
         assert product.save, "Saved the product successfuly"
    
   end
end

