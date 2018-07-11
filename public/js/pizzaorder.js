  var pizzapi = require('pizzapi');
  var myStore = 

  var tommyP = new pizzapi.Customer(
      {
          firstName: 'Tom',
          lastName: 'Panouses',
          address: '215 W Ohio street, Chicago, IL, 60654',
          email: 't@p.com'
      }
  );

  var order = new pizzapi.Order(
      {
          customer: tommyP,

          //optional set the store ID right away
          storeID: myStore.ID,

          deliveryMethod: 'Delivery' //(or 'Carryout')
      }
  );