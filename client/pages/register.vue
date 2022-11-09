<template>
<b class="row mt-5">

        <b class="col-md-5 mx-auto  card">
          <h2 class="py-3 text-center">Register</h2>

      <b-form  @submit.prevent="register ">
         <b-form-group
        id="input-group-1"
        label="Name:"
      >
        <b-form-input
          type="text"
                  class="input"
                  name="name"
                  v-model="name"
                  required

        ></b-form-input>
      </b-form-group>

         <b-form-group
        id="input-group-1"
        label="Email"
      >
        <b-form-input
                    type="email"
                  class="input"
                  name="email"
                  v-model="email"
        ></b-form-input>
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
      </b-form-group>

      <b-button type="submit" variant="outline-secondary" block pill class="mb-3">Register</b-button>


      </b-form>
      </b>
      </b>


</template>

<script>
import Notification from "~/components/Notification";
    export default {
      components: {
    Notification,
  },

  data() {
    return {
      name: '',
      email: '',
      password: '',
      error: null
    }
  },
     methods: {
    async register() {
      try {
        await this.$axios.post('http://localhost:8000/api/register', {
            name: this.name,
            email: this.email,
            password: this.password
        })

        this.$router.push('/')
      } catch (e) {
        this.error = e.response.data.message
      }
    }
  }
}
</script>


