import Vue from 'vue';
const Api = require('./api');
// Vue.use(turbolinksAdapter); // For 'yarn add vue-turbolinks'?

document.addEventListener("turbolinks:load", () => {
  var inbox = new Vue({
    el: '#inbox',
    components: {},
    data: {
      messages: [],
      unreads: [],
      message: {}
    },
    computed: {},
    methods: {
      listMessages: function() {
        Api.listMessages().then(function(response) {
          inbox.messages = response;
          inbox.unreadMessages();
        })
      },

      messageRead: function(event, id) {
        event.stopImmediatePropagation();

        let message = this.messages.find(item => item.id == id);

        if (message.read == false) {
          message.read = true;
          this.message = message;

          Api.updateMessage(this.message).then(function(response) {
            inbox.listMessages();
          })
        } else {
          this.message = message;
        }
      },

      deleteMessage: function(event, id) {
        event.stopImmediatePropagation();

        if (confirm("Are you sure?")) {

          let messageIndex = this.messages.findIndex(item => item.id == id);

          if (messageIndex > -1) {
            Api.deleteMessage(id).then(function(response) {
              inbox.$delete(inbox.messages, messageIndex);
              inbox.message = {};
              alert('Message deleted successfully.');
            });
          }
        }
      },

      unreadMessages: function() {
        Api.listMessages().then(function(response) {
          inbox.unreads = response.filter(item => item.read == false);
        });
      }
    },

    beforeMount() { 
      this.listMessages();
    }
  })
});