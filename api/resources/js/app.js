import './bootstrap';

window.vue = require('vue')

vue.component('pagination',require('laravel-vue-pagination'))

const app = new Vue
({
    el:'#app'
});
