<template>

  <b-card>
    Welcome   Dashboard {{ $auth.user.name }}

  </b-card>

</template>
 <script>
  export default {
    middleware:['auth']
  }
  </script>
