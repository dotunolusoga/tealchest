# TealChest User Story

## Title: User should be able to view items

#### Scenario 1: User logs on to application

As a User  
I want to view the inventory page  

Given: I'm a new User  
When: I log onto the website  
And: I click on 'Products'  
Then: I should be able to view the inventory page  


#### Scenario 2: User views product profile  

As a User  
I want to view the product profile  
Because I want to view the product details

Given: I'm a new User  
When: I click on the Products page  
And: I click on a product name
Then: I should be on the Product page  
And: I should be able to view the full product details


## Title: User should be able to log in

#### Scenario 1: New User tries to log in

As a new User  
I want to login  
Because I want to buy products  

Given: I'm a new User  
When: I go to the Login page  
And: I try to Login  
Then: I should be prompted to Register

#### Scenario 2: Registered User logs in

As a registered User  
I want to login  
Because I want to buy products  

Given: I'm a registered User   
When: I go to the Login page  
And: I try to login  
And: I type in my email and password  
Then: I should be logged in  
And: I should be on the inventory page


## Title: User adds item to cart   

#### Scenario: User should be able to add item to Cart

As a User
I want to put items in my shopping cart  
Because I want to manage items before I checkout

Given: I’m a logged-in User
When: I go to the Product page
And: I click “Add item to cart”
Then: the quantity of items in my cart should go up
And: my subtotal should increment
And: the inventory should decrement


## Title: User views shopping cart

#### Scenario: User should be able to view cart  

As a User  
I want to view my shopping cart  

Given: I'm a logged-in User  
When: I go to the Products page  
And: I click on my shopping cart  
Then: I should view the shopping cart details


## Title: User checks out

#### Scenario1: User should be able to check out

As a User  
I should be able to checkout
Because I want to pay for ordered Products  

Given: I'm a logged-in User  
When: I go to the Shopping Cart  
And: I click on "Checkout"  
Then: I should be on the Checkout page  
And: I should be able to choose "ship to me" option  
And: I should be able to input my cards details  
And: I should be able to pay for my order  
And: I should get an order confirmation email  
And: A new order should appear on the "Orders" page


## Title: User creates chest

As a User  
I want to create a chest  
Because I want my guests to buy their fabric  

Given: I'm a logged-in User  
When: I go to the Shopping Cart  
And: I click on "Create Chest"  
Then: I should be able to see chest info form  
And: I should be able to fill out chest info form  
And: I should be able to click "Add to Chest"
And: I should see a notification that it was saved
