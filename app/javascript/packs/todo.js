import Vue from 'vue';
import Header from './components/header.vue';

// views/home/index.erbの<navbar></navbar>にheader.vueをマウントして表示

var app = new Vue({
  el: '#app',
  components: {
    'navbar': Header
  }
});
