<template>

      <b class="row mt-5 pt-5">

        <b class="col-md-5 mx-auto  card">
          <h2 class="py-3 text-center">Login</h2>

      <b-form @submit.prevent="login ">
         <b-form-group
        id="input-group-1"
        label="Email address:"
      >
        <b-form-input
          type="email"
                  class="input"
                  name="email"
                  v-model="email"
        ></b-form-input>
         <small
                    v-if="this.error.email"
                    class="text-danger font-weight-bolder"
                    v-html="this.error.email"
                  />
      </b-form-group>

         <b-form-group
        id="input-group-1"
        label="Password"
      >
        <b-form-input
                    type="password"
                  class="input"
                  name="password"
                  v-model="password"
        ></b-form-input>
         <small
                    v-if="this.error.password"
                    class="text-danger font-weight-bolder"
                    v-html="this.error.password"
                  />
      </b-form-group>

      <b-button type="submit" variant="outline-secondary" block pill class="mb-3">Log In</b-button>


      </b-form>
      </b>
      </b>


</template>

<script>
import Notification from "~/components/Notification";

export default {
     middleware:['guest'],
  components: {
    Notification,
  },

  data() {
    return {
      email: "",
      password: "",
      error: {
       email:'',
        password:'',
      }
    };
  },

  methods: {
    login() {
      this.$auth
        .loginWith("laravelSanctum", {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then((response) => console.log(response))

           .catch((error) => {
            error.response.data.errors.email ? this.error.email = error.response.data.errors.email[0] : this.error.email ="";
          error.response.data.errors.password ? this.error.password = error.response.data.errors.password[0] : this.error.password ="";
        });

    },
  },
};
</script>
