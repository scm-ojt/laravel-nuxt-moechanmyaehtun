import './bootstrap';

window.vue = require('vue')

vue.component('pagination',require('laravel-vue-pagination'))
import Swal from 'sweetalert2'
window.Swal = Swal;
const app = new Vue
({
    el:'#app'
});
