import Vue from 'vue';
const Api = require('./api');
// Vue.use(turbolinksAdapter); // For 'yarn add vue-turbolinks'?

document.addEventListener("turbolinks:load", () => {
  var contact = new Vue({
    el: '#contact',
    components: {},
    data: {
      messages: [],
      message: {}
    },
    computed: {},
    methods: {
      listMessages: function() {
        Api.listMessages().then(function(response) {
          contact.messages = response;
        })
      },

      clearMessage: function() {
        event.stopImmediatePropagation();

        this.message = {};
      },

      createMessage: function(event) {
        Api.createMessage(this.message).then(function(response) {
          contact.listMessages();
          contact.clearMessage();
        });

        alert('Thanks! We will contact you back as soon as possible.');
      }
    }
  })
});