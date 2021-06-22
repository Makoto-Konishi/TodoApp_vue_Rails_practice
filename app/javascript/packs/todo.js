import Vue from 'vue/dist/vue.esm.js';
import Header from './components/header.vue';
import Index from './components/index.vue';

// views/home/index.erbの<navbar></navbar>にheader.vueをマウントして表示

var app = new Vue({
  el: '#app',
  components: {
    'navbar': Header,
    'index': Index
  }
});
