<template>
  <div>
    <b-navbar toggleable="sm" type="dark" variant="danger fixed-top ">
      <b-navbar-brand to="/">Nuxt</b-navbar-brand>
      <b-navbar-nav class="ml-auto">
        <template v-if="$auth.loggedIn">
          <b-nav-item> Welcome {{ $auth.user.name }} </b-nav-item>
          <b-nav-item to="/post">Post </b-nav-item>
          <b-nav-item @click.prevent="logout()">Logout</b-nav-item>
        </template>
        <template v-else>
          <b-nav-item to="/login">Login</b-nav-item>
          <b-nav-item to="/register">Register</b-nav-item>
        </template>
      </b-navbar-nav>
    </b-navbar>
    <Nuxt />
  </div>
</template>

<script>
export default {
  methods: {
    async logout() {
      try {
        await this.$auth.logout();
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
