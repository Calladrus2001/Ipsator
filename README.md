## Abstract

The app fetches available pizzas using _REST API_ and displays them using customised Widgets keeping in mind the parameters of the assignment. Further, 
by clicking on a _pizza tile_ you can customise the crust and size of the pizza. The price gets updated accordingly. User can add the item to cart from 
where he can adjust the quantity of pizzas. 

**Note** : pizzas with identical configuaration are grouped together. _Ex._ a "Medium" + "Cheese burst" pizza would add quantity by 1, if the same item is already in cart. 

## Technical

Used **http** package for _REST API_. Used **GetX** for route management. Used **Get_Storage** for storing All cart items so that they can be accessed across the app.

## Screens

<img width="848" alt="Screenshot 2022-05-14 at 2 27 15 PM" src="https://user-images.githubusercontent.com/79591529/168418771-7d4b055e-65cf-4880-803a-113e87d69d1f.png">

## Future scopes 

- In-App payments can be enabled for real-world use.
- Get_Storage _i.e_ The cart in local storage would be cleared once the transaction is done.
- More customisation options can be allowed.
- Can use _Dio_ to also get pizza images from backend server.
