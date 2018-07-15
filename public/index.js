var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        address: this.address,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  created: function() {},
  methods: {submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var PickButtonPage = {
  template: "#pick-button-page",
  data: function() {
    return {
      message: "pick-button page blah"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var ChoicesPage = {
  template: "#choices-page",
  data: function() {
    return {
      restaurants: [],
      countDown: 45,
      intervalTimer: {}
    };
  },
  created: function() {
    axios
    .get("/api/restaurants")
    .then(function(response) {
     this.restaurants = response.data; 

     // this.intervalTimer = setInterval(function() {
     //    this.countDown--;
     //    if (this.countDown < 1) {
     //      clearInterval(this.intervalTimer);

     //      window.location.href = "https://www.dominos.com/en/pages/order/#/locations/search/?type=Delivery";
     //    }
     // }.bind(this), 1000);
    }.bind(this));

  },
  methods: {},
  computed: {}
};


var router = new VueRouter({
  routes: [
            { path: "/", component: HomePage },
            { path: "/signup", component: SignupPage },
            { path: "/login", component: LoginPage },
            { path: "/pick", component: PickButtonPage },
            { path: "/choices", component: ChoicesPage }
          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});


// Why is the home page render not working? 