import Vue from 'vue';
const Api = require('./api');
// Vue.use(turbolinksAdapter); // For 'yarn add vue-turbolinks'?

document.addEventListener("turbolinks:load", () => {
  var contact = new Vue({
    el: '#contact',
    components: {
      // 'post' : {
      //   props: ['post'],
      //   template: 
      //   ` <div class="text-center">
      //       <h2>LOCATION MAP</h2>
      //       <div class="embed-responsive embed-responsive-4by3">
      //         <span class="embed-responsive-item" v-html="post.google_map_embed"></span>
      //       </div>
      //     </div>
      //   `
      // }
    },
    data: {
      // posts: [],
      messages: [],
      message: {}
    },
    computed: {},
    methods: {
      // listPosts: function() {
      //   Api.listPosts().then(function(response) {
      //     app.posts = response;
      //   })
      // },

      // currentPost: function(id) {
      //   return this.posts.filter(item => item.id == id);
      // },

      listMessages: function() {
        Api.listMessages().then(function(response) {
          contact.messages = response;
        })
      },

      clearMessage: function(event) {
        event.stopImmediatePropagation();

        this.message = {};
      },

      createMessage: function(event) {
        Api.createMessage(this.message).then(function(response) {
          contact.listMessages();
          contact.clearMessage(event);
        });

        alert('Thanks! We will contact you back as soon as possible.');
      }
    },

    // beforeMount() { this.listPosts() }
  })
});